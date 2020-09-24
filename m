Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BCABE276BF8
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 10:31:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-Y-P8uYOBNxGqpyqXVOCRIg-1; Thu, 24 Sep 2020 04:31:31 -0400
X-MC-Unique: Y-P8uYOBNxGqpyqXVOCRIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67C5B186DD52;
	Thu, 24 Sep 2020 08:31:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4454773692;
	Thu, 24 Sep 2020 08:31:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A47C5181A06E;
	Thu, 24 Sep 2020 08:31:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08O6qnNL003849 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 02:52:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 08562201C0DC; Thu, 24 Sep 2020 06:52:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0304D20244F7
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 06:52:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98C83101A53F
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 06:52:46 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-oln040092074053.outbound.protection.outlook.com [40.92.74.53])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-276-f2HbLygZOG-6NuWlKvDxYw-1; Thu, 24 Sep 2020 02:52:44 -0400
X-MC-Unique: f2HbLygZOG-6NuWlKvDxYw-1
Received: from VI1EUR04FT042.eop-eur04.prod.protection.outlook.com
	(2a01:111:e400:7e0e::52) by
	VI1EUR04HT234.eop-eur04.prod.protection.outlook.com
	(2a01:111:e400:7e0e::224) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21;
	Thu, 24 Sep 2020 06:52:42 +0000
Received: from AM0PR09MB2897.eurprd09.prod.outlook.com
	(2a01:111:e400:7e0e::45) by VI1EUR04FT042.mail.protection.outlook.com
	(2a01:111:e400:7e0e::68) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via
	Frontend Transport; Thu, 24 Sep 2020 06:52:42 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:AD711967F1D401316E24625E5CA18750713732705EB8504ECA26D58839188D08;
	UpperCasedChecksum:36BF97349FDCC4394FD28E5284E4DDE14FB61C88EA71F3163434D2C233800E3E;
	SizeAsReceived:8108; Count:49
Received: from AM0PR09MB2897.eurprd09.prod.outlook.com
	([fe80::5599:5bc3:3b28:d3c0]) by
	AM0PR09MB2897.eurprd09.prod.outlook.com
	([fe80::5599:5bc3:3b28:d3c0%4]) with mapi id 15.20.3412.020;
	Thu, 24 Sep 2020 06:52:42 +0000
From: Frank Meinl <frank.meinl@live.de>
To: Martin Wilck <mwilck@suse.com>, dm-devel@redhat.com
References: <AM0PR09MB289726B5423506E7A0CBFA47FE3B0@AM0PR09MB2897.eurprd09.prod.outlook.com>
	<42aa1aaf935927e169e27e035fe307fd8181f9a6.camel@suse.com>
Message-ID: <AM0PR09MB28971FC4C2D1E69F92BC9976FE390@AM0PR09MB2897.eurprd09.prod.outlook.com>
Date: Thu, 24 Sep 2020 08:52:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
In-Reply-To: <42aa1aaf935927e169e27e035fe307fd8181f9a6.camel@suse.com>
X-ClientProxiedBy: AM4PR0501CA0046.eurprd05.prod.outlook.com
	(2603:10a6:200:68::14) To AM0PR09MB2897.eurprd09.prod.outlook.com
	(2603:10a6:208:131::33)
X-Microsoft-Original-Message-ID: <bb182053-d2cc-f71e-7947-5f502caa1e2e@live.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:8070:a196:3b00:3d39:6008:782e:e7da]
	(2a02:8070:a196:3b00:3d39:6008:782e:e7da) by
	AM4PR0501CA0046.eurprd05.prod.outlook.com
	(2603:10a6:200:68::14) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
	id 15.20.3412.20 via Frontend Transport;
	Thu, 24 Sep 2020 06:52:41 +0000
X-Microsoft-Original-Message-ID: <bb182053-d2cc-f71e-7947-5f502caa1e2e@live.de>
X-TMN: [1h+k1WBm2fYp5bMzfpF7qViMTvQW/bSkM2v2/IdMT5UVY1mKVq72i2t7KwBYM70BfYcUsO2MU0M=]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 5885962e-1aa5-4152-9796-08d860566eea
X-MS-TrafficTypeDiagnostic: VI1EUR04HT234:
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: IzjZaj2mHV9dqOv9WAY9E27ai7jBu6Fp2Iu3rcKFG7TNZ+b/imKeGSvNm6d3umaF2dU5Qcy/4IsYbm6Zere8aIJap2mh386EH2m8c7ROZvhY7hXnF2dGB5I18bRPcUDW3Cd6dtdz3f8DCeb1+ZYSbPN09Uy1O+NWyz0UA+rglyqD14K+kxz+EfCK86r+XgIhRydb0QC+0EGkUaskDXoHNQ==
X-MS-Exchange-AntiSpam-MessageData: J5TV02H1KjAuboPzZd5DkkcCxmZyCnTG1g+UmMJaBd0Wga7FVE+o1DBxUedZcK+54W0i58wB5r1Cie2VQI109zOgP7yZpHWv8MdQ3p/Q7NLCOVHyDWwf3G3SEtVfV+64kv1mPZHjwSkC/P7/JDfgiQlphIRek4jEx+gZRTobuZe/PKmjeD4hXpRTH++bE9C0qyP0wrqXxhSb9g5knO3sNA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5885962e-1aa5-4152-9796-08d860566eea
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 06:52:42.5182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR04FT042.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT234
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 24 Sep 2020 04:31:06 -0400
Subject: Re: [dm-devel] [PATCH] libmultipath: Allow discovery of USB devices
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 22.09.20 21:59, Martin Wilck wrote:
> On Tue, 2020-09-22 at 20:34 +0200, Frank Meinl wrote:
>> This change adds a new configuration option allow_usb_devices. It is
>> disabled by default, so that the behavior of existing setups is not
>> changed. If enabled (via multipath.conf), USB devices will be found
>> during device discovery and can be used for multipath setups.
>>
>> Without this option, multipath currently ignores all USB drives,
>> which
>> is convenient for most users. (refer also to commit 51957eb)
>>
>> However, it can be beneficial to use the multipath dm-module even if
>> there is only a single path to an USB attached storage. In
>> combination
>> with the option 'queue_if_no_path', such a setup survives a temporary
>> device disconnect without any severe consequences for the running
>> applications. All I/O is queued until the device reappears.
> 
> Hm. So you want to use multipath just to enable queueing?
> I wonder if that can't be achieved some other way; multipath seems to
> be quite big hammer for this nail. Anyway, I don't think this would
> hurt us, so I don't have good reasons to reject it.

During my search for a tool, which allows to queue I/O if a device 
disappears, I checked all existing device-mapper modules. Maybe I'm 
wrong, but multipath was the only which had already everything on-board. 
Furthermore, another big advantage are the really sophisticated 
userspace tools. In fact, the tricky part is not the queuing itself, but 
the reconnect event. You have to notice when a new device appears, then 
you have to check if it's the previously disconnected device, and 
finally you have to tell the device-mapper to reroute I/O again and to 
flush the queue...
After all, I thought it would be better to misuse multipath for this, 
than to reinvent the wheel ;)

> 
> Waiting for others' opinions.
> 
>>
>> Signed-off-by: Frank Meinl <frank.meinl@live.de>
>> ---
>>   libmultipath/config.h      |  1 +
>>   libmultipath/dict.c        |  4 ++++
>>   libmultipath/discovery.c   | 13 ++++++++++---
>>   libmultipath/structs.h     |  1 +
>>   multipath/multipath.conf.5 | 14 ++++++++++++++
>>   5 files changed, 30 insertions(+), 3 deletions(-)
>>
>> diff --git a/libmultipath/config.h b/libmultipath/config.h
>> index 2bb7153b..290aea58 100644
>> --- a/libmultipath/config.h
>> +++ b/libmultipath/config.h
>> @@ -158,6 +158,7 @@ struct config {
>>   	unsigned int dev_loss;
>>   	int log_checker_err;
>>   	int allow_queueing;
>> +	int allow_usb_devices;
>>   	int find_multipaths;
>>   	uid_t uid;
>>   	gid_t gid;
>> diff --git a/libmultipath/dict.c b/libmultipath/dict.c
>> index feabae56..f12c2e5c 100644
>> --- a/libmultipath/dict.c
>> +++ b/libmultipath/dict.c
>> @@ -543,6 +543,9 @@ snprint_def_queue_without_daemon (struct config
>> *conf,
>>   declare_def_handler(checker_timeout, set_int)
>>   declare_def_snprint(checker_timeout, print_nonzero)
>>   
>> +declare_def_handler(allow_usb_devices, set_yes_no)
>> +declare_def_snprint(allow_usb_devices, print_yes_no)
>> +
>>   declare_def_handler(flush_on_last_del, set_yes_no_undef)
>>   declare_def_snprint_defint(flush_on_last_del, print_yes_no_undef,
>> DEFAULT_FLUSH)
>>   declare_ovr_handler(flush_on_last_del, set_yes_no_undef)
>> @@ -1759,6 +1762,7 @@ init_keywords(vector keywords)
>>   	install_keyword("no_path_retry", &def_no_path_retry_handler,
>> &snprint_def_no_path_retry);
>>   	install_keyword("queue_without_daemon",
>> &def_queue_without_daemon_handler,
>> &snprint_def_queue_without_daemon);
>>   	install_keyword("checker_timeout",
>> &def_checker_timeout_handler, &snprint_def_checker_timeout);
>> +	install_keyword("allow_usb_devices",
>> &def_allow_usb_devices_handler, &snprint_def_allow_usb_devices);
>>   	install_keyword("pg_timeout", &deprecated_handler,
>> &snprint_deprecated);
>>   	install_keyword("flush_on_last_del",
>> &def_flush_on_last_del_handler, &snprint_def_flush_on_last_del);
>>   	install_keyword("user_friendly_names",
>> &def_user_friendly_names_handler, &snprint_def_user_friendly_names);
>> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
>> index 2f301ac4..4b615caa 100644
>> --- a/libmultipath/discovery.c
>> +++ b/libmultipath/discovery.c
>> @@ -375,11 +375,10 @@ sysfs_get_tgt_nodename(struct path *pp, char
>> *node)
>>   	while (tgtdev) {
>>   		value = udev_device_get_subsystem(tgtdev);
>>   		if (value && !strcmp(value, "usb")) {
>> -			pp->sg_id.proto_id = SCSI_PROTOCOL_UNSPEC;
>> +			pp->sg_id.proto_id = SCSI_PROTOCOL_UAS;
> 
> How do you know this is UAS? It could as well be usb-storage, no?
> Maybe we need not differentiate the two, but asserting UAS here
> might raise wrong expectations. Maybe you should just call it
> SCSI_PROTOCOL_USB.
> 

You are correct! I checked with the kernel drivers and it seems that the 
"old" usb bulk storage driver also uses the SCSI subsystem of linux. So 
SCSI_PROTOCOL_USB would definitely be more appropriate here.

>>   			tgtname = udev_device_get_sysname(tgtdev);
>>   			strlcpy(node, tgtname, NODE_NAME_SIZE);
>> -			condlog(3, "%s: skip USB device %s", pp->dev,
>> node);
>> -			return 1;
>> +			return 0;
>>   		}
>>   		tgtdev = udev_device_get_parent(tgtdev);
>>   	}
>> @@ -2136,6 +2135,14 @@ int pathinfo(struct path *pp, struct config
>> *conf, int mask)
>>   
>>   		if (rc != PATHINFO_OK)
>>   			return rc;
>> +
>> +		if (pp->bus == SYSFS_BUS_SCSI &&
>> +		    pp->sg_id.proto_id == SCSI_PROTOCOL_UAS &&
>> +		    !conf->allow_usb_devices) {
>> +			condlog(3, "%s: skip USB device %s", pp->dev,
>> +				pp->tgt_node_name);
>> +			return PATHINFO_SKIPPED;
>> +		}
>>   	}
>>   
>>   	if (mask & DI_BLACKLIST && mask & DI_SYSFS) {
>> diff --git a/libmultipath/structs.h b/libmultipath/structs.h
>> index 4afd3e88..284c1e45 100644
>> --- a/libmultipath/structs.h
>> +++ b/libmultipath/structs.h
>> @@ -174,6 +174,7 @@ enum scsi_protocol {
>>   	SCSI_PROTOCOL_SAS = 6,
>>   	SCSI_PROTOCOL_ADT = 7,	/* Media Changers */
>>   	SCSI_PROTOCOL_ATA = 8,
>> +	SCSI_PROTOCOL_UAS = 9,  /* USB Attached SCSI */
>>   	SCSI_PROTOCOL_UNSPEC = 0xf, /* No specific protocol */
>>   };
>>   
>> diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
>> index 5adaced6..21b3bfb6 100644
>> --- a/multipath/multipath.conf.5
>> +++ b/multipath/multipath.conf.5
>> @@ -643,6 +643,20 @@ The default is: in
>> \fB/sys/block/sd<x>/device/timeout\fR
>>   .
>>   .
>>   .TP
>> +.B allow_usb_devices
>> +If set to
>> +.I no
>> +, all USB devices will be skipped during path discovery. This is
>> convenient
>> +for most users, as it effectively hides all attached USB disks and
>> flash
>> +drives from the multipath application. However, if you intend to use
>> multipath
>> +on USB attached devices, set this to \fIyes\fR.
>> +.RS
>> +.TP
>> +The default is: \fBno\fR
> 
> All factual information in the middle sentence ("This is convenient ...
> application") is already present elsewhere. Drop the sentence, please,
> and drop the "however," too.

Will do, no problem!

> 
> Martin
> 
> 

Regards,
Frank

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

