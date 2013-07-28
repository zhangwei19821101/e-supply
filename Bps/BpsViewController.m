//
//  BpsViewController.m
//  E_Supply
//
//  Created by zhangwei on 12-12-27.
//  Copyright (c) 2012年 Pixolity Ltd. All rights reserved.
//

#import "BpsViewController.h"

@interface BpsViewController ()

@end

@implementation BpsViewController

@synthesize bpssegmentedControl;
@synthesize bpsrightBarButton;


- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self != nil) {
        self.title = @"工作流";
        self.tabBarItem.image = [UIImage imageNamed:@"Checkmark.png"];
    }
    return self;
    
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //    设置视图背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // self.title = @"First Controller";
//    self.navigationItem.leftBarButtonItem =
//    [[UIBarButtonItem alloc] initWithTitle:@"Home"
//                                     style:UIBarButtonItemStylePlain
//                                    target:self
//                                    action:@selector(performAdd:)];
    
    
    
    
    //    添加右侧按钮
    NSArray *items = [[NSArray alloc] initWithObjects:
                      [UIImage imageNamed:@"UpArrow.png"],
                      [UIImage imageNamed:@"DownArrow.png"], nil];
    
    
    self.bpssegmentedControl = [[UISegmentedControl alloc]
                                            initWithItems:items];
    
    self.bpssegmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    self.bpssegmentedControl.momentary = YES;
    
    [self.bpssegmentedControl addTarget:self
                         action:@selector(segmentedControlTapped:)
               forControlEvents:UIControlEventValueChanged];
    
    self.bpsrightBarButton =
    [[UIBarButtonItem alloc] initWithCustomView:self.bpssegmentedControl];
    
    [self.navigationItem setRightBarButtonItem:self.bpsrightBarButton
                                      animated:YES];
    
     
    
    //生成邮件列表
    _items=[[NSMutableArray alloc] init];
    
    NSError *error2= nil;
    //加载一个NSURL对象
    //   NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.weather.com.cn/data/101180701.html"]];10.86.87.101:8080
    
    NSURLRequest *request2 = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.8thday.cc/mail/queryMailCondition.htm?ticket=VFhwVlBRPT07TURJeU1EQXhNakl5OzM1MzU="]];
    
    //将请求的url数据放到NSData对象中
    NSData *response2 = [NSURLConnection sendSynchronousRequest:request2 returningResponse:nil error:nil];
    //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
    NSDictionary *mailDic = [NSJSONSerialization JSONObjectWithData:response2 options:NSJSONReadingMutableLeaves error:&error2];
    if (error2) {
        NSLog(@"err=%@",[error2 localizedDescription]);
    }
    else{
          NSDictionary *dataListDic = [mailDic objectForKey:@"dataList"];
           for (NSDictionary *datalistInfo in dataListDic) {
          
            NSMutableDictionary *dic=[NSMutableDictionary dictionary];
            [dic setObject:[datalistInfo objectForKey:@"mailSubject"]
                    forKey:@"mailSubject"];
            [dic setObject:[datalistInfo objectForKey:@"sendDateStr"]
                    forKey:@"sendDateStr"];
            [dic setObject:[datalistInfo objectForKey:@"sendName"]
                    forKey:@"sendName"];
            [dic setObject:[datalistInfo objectForKey:@"mailID"]
                    forKey:@"mailID"];
            [dic setObject:[datalistInfo objectForKey:@"mailTypeStr"]
                    forKey:@"mailTypeStr"];
         
            [_items addObject:dic];
            
           }   // end for
        
    }  //end if
    
    
}


- (void) viewDidUnload
{
    
    [_items release];
    [_queue release];
    _items=nil;
    _queue=nil;
    [super viewDidUnload];
}

- (void) dealloc{
    [_items release];
    [_queue release];
    [super dealloc];
}

//返回按钮执行事件
//- (void) performAdd:(id)paramSender
//{
//    NSLog(@"Action method got called.bPS");
//   
//}


- (void) segmentedControlTapped:(UISegmentedControl *)paramSender{
    
    if ([paramSender selectedSegmentIndex] == 0){
        /* Up button */
        NSLog(@"Up");
    } else  if ([paramSender selectedSegmentIndex] == 1){
        /* Down button */
        NSLog(@"Down");
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TableViewCellIdentifier = @"Cell";
    UITableViewCell *cell=[tableView
                           dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
    if (!cell) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"BpsViewCell" owner:nil options: nil] lastObject];
        cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
        
    }
    
    
    NSDictionary *dic=[_items objectAtIndex:indexPath.row];
    //    cell.textLabel.text=[dic objectForKey:@"title"];
    [(UILabel *)[cell viewWithTag:1] setText:[dic objectForKey:@"mailTypeStr"]];
    [(UILabel *)[cell viewWithTag:2] setText:
     [NSString stringWithFormat:@"%@",[dic objectForKey:@"sendName"]]];
    [(UILabel *)[cell viewWithTag:3] setText:
     [NSString stringWithFormat:@"%@",[dic objectForKey:@"sendDateStr"]]];
    [(UILabel *)[cell viewWithTag:4] setText:
     [NSString stringWithFormat:@"%@",[dic objectForKey:@"mailSubject"]]];
   
    

    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
