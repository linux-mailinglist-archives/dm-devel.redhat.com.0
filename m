Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFE3652EA
	for <lists+dm-devel@lfdr.de>; Thu, 11 Jul 2019 10:13:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A9BB53082B69;
	Thu, 11 Jul 2019 08:13:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A90C760BFB;
	Thu, 11 Jul 2019 08:13:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6BAE541F53;
	Thu, 11 Jul 2019 08:13:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6AL9x6I010854 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Jul 2019 17:10:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F09E960A9A; Wed, 10 Jul 2019 21:09:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6186D60603;
	Wed, 10 Jul 2019 21:09:55 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A46BF9D43B;
	Wed, 10 Jul 2019 21:08:40 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x6AL8edV011740; Wed, 10 Jul 2019 21:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=subject : to : cc :
	references : from : message-id : date : mime-version : in-reply-to :
	content-type : content-transfer-encoding; s=corp-2018-07-02;
	bh=Jb+dlCArEGpeswzuzYeBLJplwmTu4H0O2r0jjy43A3k=;
	b=Dn/oBCeQR6/4jFFlX6h+7dxgCPtG1CjxVXFKMHFs8qA6Wb4Aw4k8mcX5DpJ1Atnk9bEi
	2cHJ2I5Y6Cva1oLw2wse0aD/HRnXmWOHrJPtUYTbF+ijuLUhkIMLqF4TPSDV0Sti9s2C
	pT5U35RB7PulQPehWjEMY02PBdb3Y5kaTUgxkASQYK5Gwr44C0Os+UWSxareochZJdAN
	eDUhVuxAH4mBqkRHVr43Hd0H1WRgHw6WKhty1DpV38QvCTCHDkFDJNxcjTrDoZ2PpDlb
	8vnVEOE1Hr1N9CDNxdVZEG0ELCDmzECPqVxL7iU04dhPzUBLA/aT1v1WgbBvGN8pOPtT
	/g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2130.oracle.com with ESMTP id 2tjk2tvjrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jul 2019 21:08:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x6AL7PHt167338; Wed, 10 Jul 2019 21:08:39 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userp3030.oracle.com with ESMTP id 2tn1j13rvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jul 2019 21:08:39 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6AL8cRx014240;
	Wed, 10 Jul 2019 21:08:38 GMT
Received: from Junxiaos-MacBook-Pro.local (/10.11.16.208)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 10 Jul 2019 14:08:38 -0700
To: Mike Snitzer <snitzer@redhat.com>, mpatocka@redhat.com
References: <20190710001719.2504-1-junxiao.bi@oracle.com>
	<20190710174801.GA20281@redhat.com>
From: Junxiao Bi <junxiao.bi@oracle.com>
Message-ID: <b1b34b4f-bb25-a6a6-6878-3574b6dda68a@oracle.com>
Date: Wed, 10 Jul 2019 14:08:36 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190710174801.GA20281@redhat.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9314
	signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1810050000 definitions=main-1907100243
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9314
	signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1907100244
X-Greylist: Sender passed SPF test, ACL 243 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Wed, 10 Jul 2019 21:09:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Wed, 10 Jul 2019 21:09:51 +0000 (UTC) for IP:'156.151.31.86'
	DOMAIN:'userp2130.oracle.com' HELO:'userp2130.oracle.com'
	FROM:'junxiao.bi@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.4  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.86 userp2130.oracle.com 156.151.31.86
	userp2130.oracle.com <junxiao.bi@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 11 Jul 2019 04:12:55 -0400
Cc: honglei.wang@oracle.com, dm-devel@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v2] dm-bufio: fix deadlock with loop device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Thu, 11 Jul 2019 08:13:24 +0000 (UTC)

On 7/10/19 10:48 AM, Mike Snitzer wrote:

> On Tue, Jul 09 2019 at  8:17pm -0400,
> Junxiao Bi <junxiao.bi@oracle.com> wrote:
>
>> When thin-volume was built on loop device, if available memory is low,
>> the following deadlock can be triggered.
>>
>> One process P1 was allocating memory with GFP_FS flag, direct alloc fail,
>> memory reclaim invoked memory shrinker in dm_bufio, dm_bufio_shrink_scan()
>> run, mutex dm_bufio_client->lock was acquired, then P1 wait for dm_buffer
>> io done in __try_evict_buffer->()__try_evict_buffer().
>>
>> But this io may never done as it was issued to the underlying loop device
>> who forward it using fs direct-io, there some memory allocation were using
>> GFP_FS(like do_blockdev_direct_IO()), if direct alloc fail, memory reclaim
>> will invoke memory shrinker in dm_bufio, where dm_bufio_shrink_scan()
>> will be invoked, since the mutex was already hold by P1, the loop thread
>> will hung, io will never done. ABBA deadlock.
>>
>> Signed-off-by: Junxiao Bi <junxiao.bi@oracle.com>
>> ---
>> Changes in v2:
>>    - refine the commit log
>>
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
> This needs more careful review and understanding.
ok.
>
> I'll commit to getting that done (hopefully with Mikulas' assistance)
> during the 5.3-rcX cycle.  But I'm not ready to stage this change yet.

Hi Mikulas,

Could you help take a look at this?

Thanks,

Junxiao.

>
> Revisiting dm-bufio on loop is needed.  Commit 9d28eb12447ee ("dm bufio:
> change __GFP_IO to __GFP_FS in shrinker callbacks") was meant to address
> deadlocks reported whern running on loop.  And __try_evict_buffer() has
> a check for GFP_NOFS ("!(gfp & __GFP_FS"); but that is only relevant to
> __scan() callers and dm_bufio_shrink_scan() is looking to take the lock
> before __scan() is called.  So it does seem like we have issues in the
> bufio code in general.  Needs a proper audit though.
>
> Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
