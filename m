Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 0E02A190614
	for <lists+dm-devel@lfdr.de>; Tue, 24 Mar 2020 08:10:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585033831;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8foqpytmy/dBt9i+EPa7as+cvO3i86LPzoACOF6nt8U=;
	b=HE2vi2GlF4Ztf+JMcxvOP78dHLlbT3ht+Mvup5lo2+ehuiM/ZT7gxveZR1RHzUz2O/mJyI
	v3z4iTGfTvALCSJ2TuGpHTPfUdgCSzTSIctg1zguCmTEoIOICSUozGJsL9yUGTyqMl3CWf
	WhaI8j84IgKe34Esy5yJ327dagBbdtQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-FB6nMAZXOui5KKNsMtqURw-1; Tue, 24 Mar 2020 03:10:27 -0400
X-MC-Unique: FB6nMAZXOui5KKNsMtqURw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF1FE1005516;
	Tue, 24 Mar 2020 07:10:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B9CC6266C;
	Tue, 24 Mar 2020 07:10:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D7C518089C8;
	Tue, 24 Mar 2020 07:09:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02O4MiEs026952 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 00:22:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DAB1910EE6D7; Tue, 24 Mar 2020 04:22:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D69AD10EE6D6
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 04:22:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 855308FF661
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 04:22:42 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-195-rXqjIszdPrGMGbpbcZ-PvA-1; Tue, 24 Mar 2020 00:22:40 -0400
X-MC-Unique: rXqjIszdPrGMGbpbcZ-PvA-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02O4Ju4S100523; Tue, 24 Mar 2020 04:22:37 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2120.oracle.com with ESMTP id 2ywavm22bg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2020 04:22:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02O4M9rC100645; Tue, 24 Mar 2020 04:22:37 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3030.oracle.com with ESMTP id 2yxw4nds73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Mar 2020 04:22:36 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02O4MZYH031982;
	Tue, 24 Mar 2020 04:22:36 GMT
Received: from [192.168.1.14] (/114.88.246.185)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 23 Mar 2020 21:22:35 -0700
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Hannes Reinecke <hare@suse.de>
References: <20200323150352.107826-1-hare@suse.de>
	<20200323150352.107826-2-hare@suse.de>
	<CO2PR04MB2343170DAC13D92E9A649BBFE7F10@CO2PR04MB2343.namprd04.prod.outlook.com>
From: Bob Liu <bob.liu@oracle.com>
Message-ID: <23a6c519-a1bc-6fcd-f3bc-3779ce03877c@oracle.com>
Date: Tue, 24 Mar 2020 12:22:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CO2PR04MB2343170DAC13D92E9A649BBFE7F10@CO2PR04MB2343.namprd04.prod.outlook.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9569
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	suspectscore=0
	spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0
	bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003240020
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9569
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
	malwarescore=0
	priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1011 impostorscore=0
	phishscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
	lowpriorityscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003240019
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 24 Mar 2020 03:09:32 -0400
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Johannes Thumshirn <jth@kernel.org>, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/2] dm-zoned: cache device for zones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/24/20 11:52 AM, Damien Le Moal wrote:
> +Bob who had proposed a similar change a last month.
> 

Thanks!

> On 2020/03/24 0:04, Hannes Reinecke wrote:
>> Implement 'cache' zones which reside on a different device.
>> The device is logically split into zones, which then will be
>> used as 'cache' zones, similar to the existing randow write
>> zones.
> 
> It does look like the new "cahce" zones are really used exactly as conventional
> zones of the SMR drive. So I wonder: why even define this new zone type ? We
> could have the "cache" device split into random (conventional) zones added to a
> single pool of random zones. We can simply add device awareness to the zone
> allocator to avoid as much as possible using a random zone from the same drive
> as the sequential zone it buffers. That would avoid repeating most of the code
> for cache & random.
> 
> Furthermore, this work is really great to support SMR drives with no
> conventional zones (a lot of ask for these). And considering that the new FORMAT
> WITH PRESET command is coming soon, a user will be able to reformat an SMR drive
> with sequential zones only to maximize capacity. For these, the cache device
> would need to hold the random zones, at which point the difference between cache
> and rando goes away.
> 
>>
>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>> ---
>>  drivers/md/dm-zoned-metadata.c | 174 ++++++++++++++++++++++++++++-----
>>  drivers/md/dm-zoned-reclaim.c  |  76 +++++++++++---
>>  drivers/md/dm-zoned-target.c   | 109 ++++++++++++++++++---
>>  drivers/md/dm-zoned.h          |  31 +++++-
>>  4 files changed, 339 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
>> index 369de15c4e80..41cc3a29db0b 100644
>> --- a/drivers/md/dm-zoned-metadata.c
>> +++ b/drivers/md/dm-zoned-metadata.c
>> @@ -132,6 +132,8 @@ struct dmz_sb {
>>  struct dmz_metadata {
>>  	struct dmz_dev		*dev;
>>  
>> +	struct dmz_cdev		*cdev;
> 
> Given the point above, we could have this generalized as an array of devices,
> with the first one meeting the constraints:
> * It contains the metadata
> * It has random/conventional zones, or is a regular device (with all its
> capacity used through emulated random zones)
> 

Yes, I was working my v2 patches as this.
Will send out this week.

Regards,
Bob

> I do not think that complicates the changes you did a lot. The reclaim part will
> need some more love I guess to be efficient, but it may be as simple as defining
> one work struct for each drive beside the first one.
> 
> Thoughts ?
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

