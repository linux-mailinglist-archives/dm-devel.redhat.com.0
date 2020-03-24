Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 12FD419086E
	for <lists+dm-devel@lfdr.de>; Tue, 24 Mar 2020 10:04:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585040676;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=SG82J0xvrn0neZ2SdF14KzE5Zw0PTXR1EZgVTNk8Fgo=;
	b=LTBVxwQ4NDW9dL9c8kGRS1ByhweH3Fl/5gugawkQv4KXI9r6YxCa8n35fTtbkh/Sa709RS
	AMR4uoXqitlrKDSe/rFGWA2rM+jWe7DqYLjIgsgwmE+HSrSr/ITaEBXvW55z6INc/rNMIK
	EejuRaSqcwV0dzZHmIeHxK3yA0betdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-PDuZfE-cOS-ad_Zm2Ynyzg-1; Tue, 24 Mar 2020 05:04:34 -0400
X-MC-Unique: PDuZfE-cOS-ad_Zm2Ynyzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81E3C1851C2D;
	Tue, 24 Mar 2020 09:04:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4801860BE0;
	Tue, 24 Mar 2020 09:04:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A83BF18089CD;
	Tue, 24 Mar 2020 09:04:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02O93qeX003221 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 05:03:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9514D10DCF5B; Tue, 24 Mar 2020 09:03:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 906DC10DCF44
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 09:03:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A54B185A78F
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 09:03:50 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-112-bbk02C1CO_aKed9I0EVaKQ-1; Tue, 24 Mar 2020 05:03:48 -0400
X-MC-Unique: bbk02C1CO_aKed9I0EVaKQ-1
IronPort-SDR: Q8A5yB0TRer54F6GxNLav4rofT+2brH9JGdnFqF6yJogbsTaWy2vvBP4niIyNEK2iH5jjST9gT
	dnQ34+mBDM/O87EepcrFfVN6/5P15o6kCYhWqeSe27kIF7h6xfod5GjbDsWFTPL7oHpanO0OIW
	wtDjtl3T1vVszkhLyk7O4sBVNelRwShqgC/gNbuUK9UrkODgy1YkSM7OVGhY/6y1T0HYkDdOUi
	xZC3B2Iw2Shj8KAgeTcMWOOkiX23x2LybKIOVFMZYY6b6iqVKx5wJZoT8K3KHMRFJ1A0Yzi/e9
	HmU=
X-IronPort-AV: E=Sophos;i="5.72,299,1580745600"; d="scan'208";a="241813329"
Received: from mail-bn8nam11lp2175.outbound.protection.outlook.com (HELO
	NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.175])
	by ob1.hgst.iphmx.com with ESMTP; 24 Mar 2020 17:03:45 +0800
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
	by CO2PR04MB2151.namprd04.prod.outlook.com (2603:10b6:102:17::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22;
	Tue, 24 Mar 2020 09:03:44 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2835.021;
	Tue, 24 Mar 2020 09:03:44 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>
Thread-Topic: [PATCH 1/2] dm-zoned: cache device for zones
Thread-Index: AQHWASRLqc1qNEQO6kO6DFm1DEAVQg==
Date: Tue, 24 Mar 2020 09:03:44 +0000
Message-ID: <CO2PR04MB234309CE05F101A57A12825CE7F10@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <20200323150352.107826-1-hare@suse.de>
	<20200323150352.107826-2-hare@suse.de>
	<CO2PR04MB2343170DAC13D92E9A649BBFE7F10@CO2PR04MB2343.namprd04.prod.outlook.com>
	<ac6881a9-1b9f-539d-f0e8-9039b4852a2e@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cc537d2c-2167-4105-d269-08d7cfd24188
x-ms-traffictypediagnostic: CO2PR04MB2151:
x-microsoft-antispam-prvs: <CO2PR04MB2151623C0ED5D89CDDA43F32E7F10@CO2PR04MB2151.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(91956017)(52536014)(9686003)(81156014)(7696005)(478600001)(8936002)(8676002)(71200400001)(4326008)(55016002)(81166006)(186003)(64756008)(76116006)(6916009)(66556008)(66946007)(26005)(66476007)(53546011)(33656002)(66446008)(6506007)(2906002)(86362001)(54906003)(5660300002)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CO2PR04MB2151;
	H:CO2PR04MB2343.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ENIS027FXYQem3CA85bnAvZNAtaFEh5VU3aNQcjW5x8abtq/ns3EbFuLPaG6mOL01BsZoqg+bTJk+yXmb/t6uXp2DRlgoPQwmzjoR1v7wufDZx0qGao5oxajexwtprIvmJM80PxNChpHV7ce2wwcC6qo9NCZTuXAXTgFxNcP4W5p8hvmZhNJMXUrTYV0kb3JdaHZQnZitMExbG9QoH2Ze/vDstqN3DdsrYlclWZ9ppBBjHE6AUcZGZWqH0tWNbVFO6OHvaPXnKqqgkCJ72mqH9ARFOoTobPVHLGnDnqT27MUqpl4409WR0Lb7+lJsN7fQNBmjrN4xI8EXubYZvR3dzarPIQ3xdDlFbM62pnH5upnGmmeVfjKeNGTSiBX3TJx+dB5A/0nZMOrERPbklRxDl1fETkujYVBNxZ1VNQ7FmCLkMyNtnwv8s6m9WLuILW6
x-ms-exchange-antispam-messagedata: OTYMLhjpHSWDnn4IL7LZ2a9OElAMFEAiQ29LB+TD4e6iVTtI5YVBwb1G0oUzCs3jYQYRiPuExuM94wiDZHEb8tErx75YfkXb+CFZOkdzMXZU7a5IoPQOAK5vS73rWMHpAadoEyIH5nqf3nMDK+1rjg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc537d2c-2167-4105-d269-08d7cfd24188
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 09:03:44.4862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NwkDTFKz2hCHsP08cZKgM+aFoVQZf3c95yTtMW6GYozk2hM4FGjtoAYajRvc39OwSnfgLNwVHMUsfwqNYvV5MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2151
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02O93qeX003221
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Johannes Thumshirn <jth@kernel.org>,
	Bob Liu <bob.liu@oracle.com>, Mike Snitzer <snitzer@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/03/24 16:51, Hannes Reinecke wrote:
> On 3/24/20 4:52 AM, Damien Le Moal wrote:
>> +Bob who had proposed a similar change a last month.
>>
>> On 2020/03/24 0:04, Hannes Reinecke wrote:
>>> Implement 'cache' zones which reside on a different device.
>>> The device is logically split into zones, which then will be
>>> used as 'cache' zones, similar to the existing randow write
>>> zones.
>>
>> It does look like the new "cache" zones are really used exactly as conventional
>> zones of the SMR drive. So I wonder: why even define this new zone type ? We
>> could have the "cache" device split into random (conventional) zones added to a
>> single pool of random zones. We can simply add device awareness to the zone
>> allocator to avoid as much as possible using a random zone from the same drive
>> as the sequential zone it buffers. That would avoid repeating most of the code
>> for cache & random.
>>
> Yes, indeed that was the idea to keep 'cache' and 'random' zones 
> essentially similar. But then as there is a need to differentiate 
> between them I thought it easier to introduce a new zone type.
> 
> However, it's a nice idea to use the device to differentiate between 
> both. And it would even lend to a simpler reclaim mechanism; set the low 
> watermark when all random zones on the cache device are full, and set 
> the high watermark when half of the random zones on the SMR device are full.
> 
> I'll give it a go and see where I end up.
> 
>> Furthermore, this work is really great to support SMR drives with no
>> conventional zones (a lot of ask for these). And considering that the new FORMAT
>> WITH PRESET command is coming soon, a user will be able to reformat an SMR drive
>> with sequential zones only to maximize capacity. For these, the cache device
>> would need to hold the random zones, at which point the difference between cache
>> and rando goes away.
>>
> I know :-)
> 
>>>
>>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>>> ---
>>>   drivers/md/dm-zoned-metadata.c | 174 ++++++++++++++++++++++++++++-----
>>>   drivers/md/dm-zoned-reclaim.c  |  76 +++++++++++---
>>>   drivers/md/dm-zoned-target.c   | 109 ++++++++++++++++++---
>>>   drivers/md/dm-zoned.h          |  31 +++++-
>>>   4 files changed, 339 insertions(+), 51 deletions(-)
>>>
>>> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
>>> index 369de15c4e80..41cc3a29db0b 100644
>>> --- a/drivers/md/dm-zoned-metadata.c
>>> +++ b/drivers/md/dm-zoned-metadata.c
>>> @@ -132,6 +132,8 @@ struct dmz_sb {
>>>   struct dmz_metadata {
>>>   	struct dmz_dev		*dev;
>>>   
>>> +	struct dmz_cdev		*cdev;
>>
>> Given the point above, we could have this generalized as an array of devices,
>> with the first one meeting the constraints:
>> * It contains the metadata
>> * It has random/conventional zones, or is a regular device (with all its
>> capacity used through emulated random zones)
>>
>> I do not think that complicates the changes you did a lot. The reclaim part will
>> need some more love I guess to be efficient, but it may be as simple as defining
>> one work struct for each drive beside the first one.
>>
>> Thoughts ?
>>
> Rather not. Stringing several devices together essentially emulates a 
> RAID0 setup without any of the benefits. And the reclaim mechanism gets 
> infinitely more complex.

OK. Fair point.

> 
> Another thing: I would need to update the metadata to hold the device 
> and zoneset UUID; both devices need to carry a metadata so that we can 
> stitch them together upon restart.
> 
> But some bright soul put a crc in the middle of the metadata :-(
> So we can't easily extend the metadata with new fields as then the 
> meaning of the crc is unclear; as it stands it would only cover the old 
> fields, and not the new ones.

Haha ! OK. You got me. Not my finest hour on this one :)

> So I would propose a 'v2' metadata, holding the crc as the last entry of 
> the metadata. And adding a device UUID and cacheset UUID.
> And ensuring that the first metadata set is stored on the cache device, 
> and the backup one on the SMR device.

That would work.

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

