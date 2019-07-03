Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 878735F320
	for <lists+dm-devel@lfdr.de>; Thu,  4 Jul 2019 08:57:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BFFFD308FBAC;
	Thu,  4 Jul 2019 06:57:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F01451001B04;
	Thu,  4 Jul 2019 06:57:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 53BCA18184A4;
	Thu,  4 Jul 2019 06:56:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x63HJnQU004066 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Jul 2019 13:19:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6AF82BA40; Wed,  3 Jul 2019 17:19:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8B204262;
	Wed,  3 Jul 2019 17:19:44 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B457A81F25;
	Wed,  3 Jul 2019 17:19:06 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x63HDmED179740; Wed, 3 Jul 2019 17:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=subject : to : cc :
	references : from : message-id : date : mime-version : in-reply-to :
	content-type : content-transfer-encoding; s=corp-2018-07-02;
	bh=2nqaeIcEAEosw2bwBSOHWyhmqYAYprTF/KaWUYDGlyk=;
	b=mAfY5ynFV44o/S9/rdJ37kp1nfgwh7Hk2TfuoIISvu934o8X1oLC1YK1qIVIThbpz+bj
	UaYJ8vlXHIoSoN2JHN8h23ZB+HjUfwX6mFbzK0xlJL7kyXQkgGbVNAjrTtPPnBwtn2OH
	aydTqItdxCLw5IHn9WYZGkQhXdXynpMr6vqsjKR39KpGioV0xno4fwewbPgJR51Wc+oC
	FhYF89Ux/Qzjlv1VSAiiTxzHclIovI8YWkNgMUtGcDPeZH4+3IBv2Fh1B0vE/AU1leCc
	1RVlP8zDMSRynlwnCmcpXqSf5l8zIneK3foramcukKZHEDkpg/pmFIs2R/6T90KS31y9
	2w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2120.oracle.com with ESMTP id 2te5tbts9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 03 Jul 2019 17:19:06 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x63HITiX158105; Wed, 3 Jul 2019 17:19:05 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3020.oracle.com with ESMTP id 2tebkv0cca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 03 Jul 2019 17:19:05 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x63HJ44f029744;
	Wed, 3 Jul 2019 17:19:05 GMT
Received: from Junxiaos-MacBook-Pro.local (/10.11.16.208)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 03 Jul 2019 10:19:04 -0700
To: Mike Snitzer <snitzer@redhat.com>
References: <20190702231456.19121-1-junxiao.bi@oracle.com>
	<20190703162106.GA13984@redhat.com>
From: Junxiao Bi <junxiao.bi@oracle.com>
Message-ID: <1aa51708-1c1b-bd12-72ed-ecbae39043f7@oracle.com>
Date: Wed, 3 Jul 2019 10:19:02 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703162106.GA13984@redhat.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9307
	signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1907030210
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9307
	signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1907030209
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Wed, 03 Jul 2019 17:19:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Wed, 03 Jul 2019 17:19:29 +0000 (UTC) for IP:'141.146.126.78'
	DOMAIN:'aserp2120.oracle.com' HELO:'aserp2120.oracle.com'
	FROM:'junxiao.bi@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.4  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 141.146.126.78 aserp2120.oracle.com 141.146.126.78
	aserp2120.oracle.com <junxiao.bi@oracle.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 04 Jul 2019 02:55:40 -0400
Cc: honglei.wang@oracle.com, dm-devel@redhat.com, mpatocka@redhat.com,
	agk@redhat.com
Subject: Re: [dm-devel] dm bufio: fix deadlock issue with loop device
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Thu, 04 Jul 2019 06:57:40 +0000 (UTC)

Hi Mike,

Thanks for reviewing, see comments inlined.

On 7/3/19 9:21 AM, Mike Snitzer wrote:
> On Tue, Jul 02 2019 at  7:14pm -0400,
> Junxiao Bi <junxiao.bi@oracle.com> wrote:
>
>> The following deadlock was caputred on 4.1, since dm_bufio_shrink_count
>> still had bufio lock acquired, this was already fixed by mainline. But
>> shrinker will also invoke dm_bufio_shrink_scan by ->scan_objects, so
>> looks like mainline will suffer the same deadlock issue.
>>
>> This deadlock happened when both kswapd0 and loop1 were shrinking memory,
>> kswapd0 hold bufio lock and waiting for an in-flight io done, but it will
>> never done because loop1 who was issuing the io was hung by the same lock
>> hold by kswapd0. This was ABBA deadlock.
>>
>> The gfp_flags used in direct IO is GFP_KERNEL, so checking GFP_FS/IO won't
>> work, just stop shrinking if lock was hold by others.
>>
>> PID: 474    TASK: ffff8813e11f4600  CPU: 10  COMMAND: "kswapd0"
>>     #0 [ffff8813dedfb938] __schedule at ffffffff8173f405
>>     #1 [ffff8813dedfb990] schedule at ffffffff8173fa27
>>     #2 [ffff8813dedfb9b0] schedule_timeout at ffffffff81742fec
>>     #3 [ffff8813dedfba60] io_schedule_timeout at ffffffff8173f186
>>     #4 [ffff8813dedfbaa0] bit_wait_io at ffffffff8174034f
>>     #5 [ffff8813dedfbac0] __wait_on_bit at ffffffff8173fec8
>>     #6 [ffff8813dedfbb10] out_of_line_wait_on_bit at ffffffff8173ff81
>>     #7 [ffff8813dedfbb90] __make_buffer_clean at ffffffffa038736f [dm_bufio]
>>     #8 [ffff8813dedfbbb0] __try_evict_buffer at ffffffffa0387bb8 [dm_bufio]
>>     #9 [ffff8813dedfbbd0] dm_bufio_shrink_scan at ffffffffa0387cc3 [dm_bufio]
>>    #10 [ffff8813dedfbc40] shrink_slab at ffffffff811a87ce
>>    #11 [ffff8813dedfbd30] shrink_zone at ffffffff811ad778
>>    #12 [ffff8813dedfbdc0] kswapd at ffffffff811ae92f
>>    #13 [ffff8813dedfbec0] kthread at ffffffff810a8428
>>    #14 [ffff8813dedfbf50] ret_from_fork at ffffffff81745242
>>
>>    PID: 14127  TASK: ffff881455749c00  CPU: 11  COMMAND: "loop1"
>>     #0 [ffff88272f5af228] __schedule at ffffffff8173f405
>>     #1 [ffff88272f5af280] schedule at ffffffff8173fa27
>>     #2 [ffff88272f5af2a0] schedule_preempt_disabled at ffffffff8173fd5e
>>     #3 [ffff88272f5af2b0] __mutex_lock_slowpath at ffffffff81741fb5
>>     #4 [ffff88272f5af330] mutex_lock at ffffffff81742133
>>     #5 [ffff88272f5af350] dm_bufio_shrink_count at ffffffffa03865f9 [dm_bufio]
>>     #6 [ffff88272f5af380] shrink_slab at ffffffff811a86bd
>>     #7 [ffff88272f5af470] shrink_zone at ffffffff811ad778
>>     #8 [ffff88272f5af500] do_try_to_free_pages at ffffffff811adb34
>>     #9 [ffff88272f5af590] try_to_free_pages at ffffffff811adef8
>>    #10 [ffff88272f5af610] __alloc_pages_nodemask at ffffffff811a09c3
>>    #11 [ffff88272f5af710] alloc_pages_current at ffffffff811e8b71
>>    #12 [ffff88272f5af760] new_slab at ffffffff811f4523
>>    #13 [ffff88272f5af7b0] __slab_alloc at ffffffff8173a1b5
>>    #14 [ffff88272f5af880] kmem_cache_alloc at ffffffff811f484b
>>    #15 [ffff88272f5af8d0] do_blockdev_direct_IO at ffffffff812535b3
>>    #16 [ffff88272f5afb00] __blockdev_direct_IO at ffffffff81255dc3
>>    #17 [ffff88272f5afb30] xfs_vm_direct_IO at ffffffffa01fe3fc [xfs]
>>    #18 [ffff88272f5afb90] generic_file_read_iter at ffffffff81198994
>>    #19 [ffff88272f5afc50] __dta_xfs_file_read_iter_2398 at ffffffffa020c970 [xfs]
>>    #20 [ffff88272f5afcc0] lo_rw_aio at ffffffffa0377042 [loop]
>>    #21 [ffff88272f5afd70] loop_queue_work at ffffffffa0377c3b [loop]
>>    #22 [ffff88272f5afe60] kthread_worker_fn at ffffffff810a8a0c
>>    #23 [ffff88272f5afec0] kthread at ffffffff810a8428
>>    #24 [ffff88272f5aff50] ret_from_fork at ffffffff81745242
>>
>> Signed-off-by: Junxiao Bi <junxiao.bi@oracle.com>
>> ---
>>   drivers/md/dm-bufio.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
>> index 2a48ea3f1b30..b6b5acc92ca2 100644
>> --- a/drivers/md/dm-bufio.c
>> +++ b/drivers/md/dm-bufio.c
>> @@ -1599,9 +1599,7 @@ dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
>>   	unsigned long freed;
>>   
>>   	c = container_of(shrink, struct dm_bufio_client, shrinker);
>> -	if (sc->gfp_mask & __GFP_FS)
>> -		dm_bufio_lock(c);
>> -	else if (!dm_bufio_trylock(c))
>> +	if (!dm_bufio_trylock(c))
>>   		return SHRINK_STOP;
>>   
>>   	freed  = __scan(c, sc->nr_to_scan, sc->gfp_mask);
>> -- 
>> 2.17.1
>>
> I don't follow how this fixes the direct IO to DM device ontop of loop
> case given that you're saying __GFP_FS will not have been set by the
> direct IO path.  In that case it should resort to the trylock anyway,
> no?
See the call trace of loop, in do_blockdev_direct_IO(), to alloc dio, 
GFP_KERNEL was used, __GFP_FS was implied by it. So it hung by bufio lock.
>
> We need a reproducer in the context of the latest upstream kernel code,
> not some 4.1 branch point for an Oracle kernel.
>
> Please submit with a less conflated patch header that has a description
> of the bufio issue that the upstream kernel has.
The call trace is just to give an example of the deadlock. Mainline 
didn't use lock in dm_bufio_shrink_count, but it does use in

dm_bufio_shrink_scan which will be invoked by the memory shrinker in the same context by loop, so it will suffer the same deadlock.
This is hard to reproduce and customer help us reproduced it, we don't reproduce it.

Thanks,
Junxiao

>
> Thanks,
> Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
