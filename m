Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 69B351CD4BD
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 11:20:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589188850;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+zpUpl/jt2AsTSSTb8Lx3JKa91+TVvr0Q/XyZZHodIU=;
	b=Kx1wGGS3wvI5vYq/VB7Cjz4a92/RDNrZ8xRCBWfj4wFnHgMgXDqxacPYPCPesl5M4eoBkA
	SuzbzC+BqvRlmyTYXmFNGi3FIH9f4+t2oQ/NTscRaJL7bjlcEVDfSYnqa3OYh0Ev7VOu5e
	8LWRNi3hrd+wuIaravWIL2gZe7lD/qo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-0JtMHai0Nu6FR_qgRggUig-1; Mon, 11 May 2020 05:20:47 -0400
X-MC-Unique: 0JtMHai0Nu6FR_qgRggUig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9C3D8014C0;
	Mon, 11 May 2020 09:20:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E789319167;
	Mon, 11 May 2020 09:20:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B59ED4E561;
	Mon, 11 May 2020 09:20:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04B9KWlP004774 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 05:20:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0BCF5D29DF; Mon, 11 May 2020 09:20:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06A95D29DD
	for <dm-devel@redhat.com>; Mon, 11 May 2020 09:20:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CA8780CDB0
	for <dm-devel@redhat.com>; Mon, 11 May 2020 09:20:30 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-37-YXp4pi5tNsuQ0wWmTIlXPQ-1; Mon, 11 May 2020 05:20:22 -0400
X-MC-Unique: YXp4pi5tNsuQ0wWmTIlXPQ-1
IronPort-SDR: JUBVyIUZomgdnah3vwUcfLrwu69MLauUw5cziHCegoyxqg0BuUDjzmCO9UV4ERchxP4xAVya/n
	G4fEz8QOIoQGNjjuLG3kLHJNuD4LMQHAdljdkz70ZMjKfWkF7gaP4mafqYsvi3ZtQ5xS+eCwC7
	4snGGVHRm7MxZ90sAc2PILnLo6OLqDF7ToDh+HrvTtYmU781oF1FkmmjL4WIjjEj6c7CMTLH6w
	U1dvnlDDsD1F+o0ypy1Jdu1WuGAeKi1jufFKl3/O8sEUc7QETZ01qZpKnUDIau5EBDm8MSRJw6
	8wk=
X-IronPort-AV: E=Sophos;i="5.73,379,1583164800"; d="scan'208";a="240077231"
Received: from mail-bn8nam11lp2171.outbound.protection.outlook.com (HELO
	NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.171])
	by ob1.hgst.iphmx.com with ESMTP; 11 May 2020 17:20:45 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB7027.namprd04.prod.outlook.com (2603:10b6:a03:225::7)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28;
	Mon, 11 May 2020 09:20:19 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.2979.033;
	Mon, 11 May 2020 09:20:19 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 15/15] dm-zoned: metadata version 2
Thread-Index: AQHWJ22lcTwtwhdDzUiQksK61WmZkQ==
Date: Mon, 11 May 2020 09:20:18 +0000
Message-ID: <BY5PR04MB6900BE67E0E6C4E515A7EB41E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200511082430.39455-1-hare@suse.de>
	<20200511082430.39455-16-hare@suse.de>
	<BY5PR04MB69008424543BE9E497BBEE9DE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<0601428c-8c71-06a9-07b9-d7b1b6331c70@suse.de>
	<BY5PR04MB6900D34837D615DB2C1EB80FE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<975783a2-79fd-3453-1a31-18bb85613330@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b484262c-a24b-41ef-b095-08d7f58c862e
x-ms-traffictypediagnostic: BY5PR04MB7027:
x-microsoft-antispam-prvs: <BY5PR04MB70271299F75417A1456915E4E7A10@BY5PR04MB7027.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 04004D94E2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kbnZtcTK+LvnVcFrXka7cZZVRLNw6rgjJiLIBG93x6R7vNrgdwpBYDtGQQYUI8BBqYoQM0jrqh8se+9GMngWrNU3awZScnhG/1LOSWyd1pji40A+AefiRgNO9enHSXPbT4hAfLcxnTmuknKTyd+CgxDT3T3jymbzu/3ISOvkanYCLS1sASa7LpnCwKOCtO5+Jpn5xFjS9HXC3pScLn/K/J/ZGl1pEbsfSQjEEGpTyg9W3wjFh02KNg1UdjYP8w8p7xvGvZ+htc427vx8pRQmX5XpCW1ps8A8K5LNjTM/WzE1uokwVuJJN0/+NL4c2yOvyRfN/2Yux/qsjCmwzHDO8mttvVITf/wI3LsjZ6l8yGFPo1hDGJG2Q9m7+7NJWtIJ2f2BjMt7o2zbDr9rEVJClgMmzWNfu+Su5QtCoy3ix9HCm47OeaqDT8f/VT9MQPmE1lpfJFZTeX8IKMlmNkFRF7CIgQeWAWnLPDJtrm0cJFwjou1IphhwxR2cSUkaw7Z0o0/NRB6WTLFdLfxANZuDOQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(33430700001)(7696005)(4326008)(8936002)(55016002)(9686003)(66946007)(66446008)(64756008)(66476007)(66556008)(33656002)(86362001)(2906002)(52536014)(76116006)(6506007)(8676002)(53546011)(26005)(33440700001)(71200400001)(5660300002)(478600001)(110136005)(54906003)(186003)(316002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: zwD9mI9DWSpUhPug4K+2lsvNqZFlwyKXNPJXXU4TCX+wfylAoxfHb39ml7u+nuvaLFyhSDib9NksVZeNLu54KMRrvbi/BeRKBKBkhEh8T2Tx+Bccy0rvQiRu3sm3FXUnM0U/Tu2Q/9BYt4z+tdka7GMEq3JmXMKh06Kv/7E83ijm4JiM4v3bP8TbkXNpYGpCgWG3Pv2Jw9AFSe+zSyxeJU2i9zRmEUNDlJ9zWUJvFY/JbB3nZ3OFtZSn9ppT0WpqCacjihfzWQ6UmQ3/QxZKcKuewaB87nWE0VhmLCP9gUTNi2N17vH/MD4h37sDhSa3hEq5PAivOuhebp0XtmTkGMRl71sq0EBy6CcR6+EpAzRbao5jPLlk6bHAl4wSy2Hu0ND8n4UMs0X/Kp13hXGYg6HdKvmLySlr73ClY0hZV906Y+RDyeKtv924P7MHKse49DUhudl2/8hqXiw/tGsllWGKbmxOgbbZs/PKHcl0Mgbl1T/KBlZr+zcWJQ1pGNWC
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b484262c-a24b-41ef-b095-08d7f58c862e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2020 09:20:18.9975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AnKBg/ikQ4mZjesDKr6Xxa/4311nUNl0l4AzVjoCCYlHWK8XNaDC9Z7CJuLPnqyJj1Qu/jpCu429z59M56DSPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7027
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04B9KWlP004774
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 15/15] dm-zoned: metadata version 2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/11 18:19, Hannes Reinecke wrote:
> On 5/11/20 10:51 AM, Damien Le Moal wrote:
>> On 2020/05/11 17:46, Hannes Reinecke wrote:
>>> On 5/11/20 10:36 AM, Damien Le Moal wrote:
>>>> On 2020/05/11 17:24, Hannes Reinecke wrote:
>>>>> Implement handling for metadata version 2. The new metadata adds
>>>>> a label and UUID for the device mapper device, and additional UUID
>>>>> for the underlying block devices.
>>>>> It also allows for an additional regular drive to be used for
>>>>> emulating random access zones. The emulated zones will be placed
>>>>> logically in front of the zones from the zoned block device, causing
>>>>> the superblocks and metadata to be stored on that device.
>>>>> The first zone of the original zoned device will be used to hold
>>>>> another, tertiary copy of the metadata; this copy carries a
>>>>> generation number of 0 and is never updated; it's just used
>>>>> for identification.
>>>>>
>>>>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>>>>> Reviewed-by: Bob Liu <bob.liu@oracle.com>
>>>>> Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
>>>>
>>>> Forgot to read through the documentation update. A couple of comments added below.
>>>>
>>>>> ---
>>>>>    .../admin-guide/device-mapper/dm-zoned.rst         |  34 ++-
>>>>>    drivers/md/dm-zoned-metadata.c                     | 310 +++++++++++++++++----
>>>>>    drivers/md/dm-zoned-target.c                       | 185 ++++++++----
>>>>>    drivers/md/dm-zoned.h                              |   7 +-
>>>>>    4 files changed, 427 insertions(+), 109 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/admin-guide/device-mapper/dm-zoned.rst b/Documentation/admin-guide/device-mapper/dm-zoned.rst
>>>>> index 7547ce635161..553752ea2521 100644
>>>>> --- a/Documentation/admin-guide/device-mapper/dm-zoned.rst
>>>>> +++ b/Documentation/admin-guide/device-mapper/dm-zoned.rst
>>>>> @@ -37,9 +37,13 @@ Algorithm
>>>>>    dm-zoned implements an on-disk buffering scheme to handle non-sequential
>>>>>    write accesses to the sequential zones of a zoned block device.
>>>>>    Conventional zones are used for caching as well as for storing internal
>>>>> -metadata.
>>>>> +metadata. It can also use a regular block device together with the zoned
>>>>> +block device; in that case the regular block device will be split logically
>>>>> +in zones with the same size as the zoned block device. These zones will be
>>>>> +placed in front of the zones from the zoned block device and will be handled
>>>>> +just like conventional zones.
>>>>>    
>>>>> -The zones of the device are separated into 2 types:
>>>>> +The zones of the device(s) are separated into 2 types:
>>>>>    
>>>>>    1) Metadata zones: these are conventional zones used to store metadata.
>>>>>    Metadata zones are not reported as useable capacity to the user.
>>>>> @@ -127,6 +131,13 @@ resumed. Flushing metadata thus only temporarily delays write and
>>>>>    discard requests. Read requests can be processed concurrently while
>>>>>    metadata flush is being executed.
>>>>>    
>>>>> +If a regular device is used in conjunction with the zoned block device,
>>>>> +a third set of metadata (without the zone bitmaps) is written to the
>>>>> +start of the zoned block device. This metadata has a generation counter of
>>>>> +'0' and will never be updated during normal operation; it just serves for
>>>>> +identification purposes. The first and second copy of the metadata
>>>>> +are located at the start of the regular block device.
>>>>> +
>>>>>    Usage
>>>>>    =====
>>>>>    
>>>>> @@ -138,12 +149,21 @@ Ex::
>>>>>    
>>>>>    	dmzadm --format /dev/sdxx
>>>>>    
>>>>> -For a formatted device, the target can be created normally with the
>>>>> -dmsetup utility. The only parameter that dm-zoned requires is the
>>>>> -underlying zoned block device name. Ex::
>>>>>    
>>>>> -	echo "0 `blockdev --getsize ${dev}` zoned ${dev}" | \
>>>>> -	dmsetup create dmz-`basename ${dev}`
>>>>> +If two drives are to be used, both devices must be specified, with the
>>>>> +regular block device as the first device.
>>>>
>>>> Actually, the zoned block device must be first. Otherwise dmzadm complains. We
>>>> can change that, or change the doc. Which do you prefer ? No strong opinion here.
>>>>
>>> Nope, not any more. Fixed it in my local repo (which I haven't pushed,
>>> sorry).
>>>
>>> But after the last discussion we had I thought it better and more
>>> consistent to have the regular device first, just like the device-mapper
>>> interface.
>>
>> Works for me !
>>
> 
> I do hope so :-)
> I've spun a new version against the master branch.
> 
>>>
>>>>> +
>>>>> +Ex::
>>>>> +
>>>>> +	dmzadm --format /dev/sdxx /dev/sdyy
>>>>> +
>>>>> +
>>>>> +Fomatted device(s) can be started with the dmzadm utility, too.:
>>>>> +
>>>>> +Ex::
>>>>> +
>>>>> +	dmzadm --start /dev/sdxx /dev/sdyy
>>>>
>>>> And same here, the zoned device must come first. I added a patch that internally
>>>> reverse that order for the dm start operation so that the regular device is
>>>> specified first.
>>>>
>>> See above. I've fixed up dmzadm for this.
>>>
>>> I just hadn't pushed the patch as I wanted to get the kernel bits
>>> settled. But now that we have I'll be pushing the dm-zoned-tools updates.
>>
>> Please send changes on top of the "staging" branch. Your first batch of changes
>> is already merged in that branch.
>>
> Rah. Send a new merge request for 'master'; will be doing an update to 
> the 'staging' branch, too.

Don't bother, will respin the staging branch with the new PR.

> 
> Cheers,
> 
> Hannes
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

