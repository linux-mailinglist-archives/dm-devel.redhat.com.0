Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CD8932685BD
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 09:24:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-KDVj9PoGOHa_wTqZKSMf-w-1; Mon, 14 Sep 2020 03:24:23 -0400
X-MC-Unique: KDVj9PoGOHa_wTqZKSMf-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2799F1882FB5;
	Mon, 14 Sep 2020 07:24:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02AF960F96;
	Mon, 14 Sep 2020 07:24:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A19D21832FDC;
	Mon, 14 Sep 2020 07:24:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08AMGOh5009808 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 18:16:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8433B1006186; Thu, 10 Sep 2020 22:16:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F5F81121330
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 22:16:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C069811E76
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 22:16:22 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-223-K-u5FfbhO628jLfiwgJdVg-1; Thu, 10 Sep 2020 18:16:20 -0400
X-MC-Unique: K-u5FfbhO628jLfiwgJdVg-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08AJO3dK188331; Thu, 10 Sep 2020 19:29:51 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2120.oracle.com with ESMTP id 33c3ana368-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 10 Sep 2020 19:29:51 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	08AJP9oH135955; Thu, 10 Sep 2020 19:29:50 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3020.oracle.com with ESMTP id 33cmkajt7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Sep 2020 19:29:50 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08AJTnSN018042;
	Thu, 10 Sep 2020 19:29:49 GMT
Received: from [10.191.236.131] (/10.191.236.131)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 10 Sep 2020 12:29:48 -0700
To: Mike Snitzer <snitzer@redhat.com>
References: <529c2394-1b58-b9d8-d462-1f3de1b78ac8@oracle.com>
	<20200910142438.GA21919@redhat.com>
From: Vijayendra Suman <vijayendra.suman@oracle.com>
Organization: Oracle Corporation
Message-ID: <5261af10-bf5c-f768-dbeb-2e784a5823f9@oracle.com>
Date: Fri, 11 Sep 2020 00:59:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200910142438.GA21919@redhat.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9740
	signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	malwarescore=0 phishscore=0
	mlxlogscore=999 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009100177
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9740
	signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	priorityscore=1501
	clxscore=1011 bulkscore=0 malwarescore=0 lowpriorityscore=0
	mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0 impostorscore=0
	spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2006250000 definitions=main-2009100177
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 14 Sep 2020 03:23:33 -0400
Cc: linux-block@vger.kernel.org,
	Somu Krishnasamy <somasundaram.krishnasamy@oracle.com>,
	dm-devel@redhat.com, RAMANAN_GOVINDARAJAN <ramanan.govindarajan@oracle.com>
Subject: Re: [dm-devel] Revert "dm: always call blk_queue_split() in
	dm_process_bio()"
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello Mike,

I checked with upstream, performance measurement is similar and shows 
performance improvement when 120c9257f5f19e5d1e87efcbb5531b7cd81b7d74 is 
reverted.

On 9/10/2020 7:54 PM, Mike Snitzer wrote:
> [cc'ing dm-devel and linux-block because this is upstream concern too]
>
> On Wed, Sep 09 2020 at  1:00pm -0400,
> Vijayendra Suman <vijayendra.suman@oracle.com> wrote:
>
>>     Hello Mike,
>>
>>     While Running pgbench tool with  5.4.17 kernel build
>>
>>     Following performance degrade is found out
>>
>>     buffer read/write metric : -17.2%
>>     cache read/write metric : -18.7%
>>     disk read/write metric : -19%
>>
>>     buffer
>>     number of transactions actually processed: 840972
>>     latency average = 24.013 ms
>>     tps = 4664.153934 (including connections establishing)
>>     tps = 4664.421492 (excluding connections establishing)
>>
>>     cache
>>     number of transactions actually processed: 551345
>>     latency average = 36.949 ms
>>     tps = 3031.223905 (including connections establishing)
>>     tps = 3031.402581 (excluding connections establishing)
>>
>>     After revert of Commit
>>     2892100bc85ae446088cebe0c00ba9b194c0ac9d ( Revert "dm: always call
>>     blk_queue_split() in dm_process_bio()")
> I assume 2892100bc85ae446088cebe0c00ba9b194c0ac9d is 5.4-stable's
> backport of upstream commit 120c9257f5f19e5d1e87efcbb5531b7cd81b7d74 ?
Yes
>>     Performance is Counter measurement
>>
>>     buffer ->
>>     number of transactions actually processed: 1135735
>>     latency average = 17.799 ms
>>     tps = 6292.586749 (including connections establishing)
>>     tps = 6292.875089 (excluding connections establishing)
>>
>>     cache ->
>>     number of transactions actually processed: 648177
>>     latency average = 31.217 ms
>>     tps = 3587.755975 (including connections establishing)
>>     tps = 3587.966359 (excluding connections establishing)
>>
>>     Following is your commit
>>
>>     diff --git a/drivers/md/dm.c b/drivers/md/dm.c
>>     index cf71a2277d60..1e6e0c970e19 100644
>>     --- a/drivers/md/dm.c
>>     +++ b/drivers/md/dm.c
>>     @@ -1760,8 +1760,9 @@ static blk_qc_t dm_process_bio(struct mapped_device
>>     *md,
>>              * won't be imposed.
>>              */
>>             if (current->bio_list) {
>>     -               blk_queue_split(md->queue, &bio);
>>     -               if (!is_abnormal_io(bio))
>>     +               if (is_abnormal_io(bio))
>>     +                       blk_queue_split(md->queue, &bio);
>>     +               else
>>                             dm_queue_split(md, ti, &bio);
>>             }
>>
>>     Could you have a look if it is safe to revert this commit.
> No, it really isn't a good idea given what was documented in the commit
> header for commit 120c9257f5f19e5d1e87efcbb5531b7cd81b7d74 -- the
> excessive splitting is not conducive to performance either.
>
> So I think we need to identify _why_ reverting this commit is causing
> such a performance improvement.  Why is calling blk_queue_split() before
> dm_queue_split() benefiting your pgbench workload?
Let me know if you want to check some patch.
>
> Thanks,
> Mike
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

