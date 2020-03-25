Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id A9252192218
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 09:03:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585123391;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=RhCvQBVuZiERjZTzY80NW/i/1wPVHqyus0z6TyBF89c=;
	b=LP9v7AZmHpLw7eRIgg/jhvZP5SPxT9yQyTw/UVYnYgiYACvUojZ/OseYdZ5TI7ypYSzfh6
	TYJfDDMqAP7FJjMxNZjnTBvzCHwSLRpPacW7TxLaySlVGQrI3+HBSnU93NMAAsYAdbIQCz
	cA2PPsDe0xDSrk747V38ke+yr/HlcS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-Hy_OVGyjNmC5O8uQ3re8pg-1; Wed, 25 Mar 2020 04:03:08 -0400
X-MC-Unique: Hy_OVGyjNmC5O8uQ3re8pg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C57ED800D50;
	Wed, 25 Mar 2020 08:03:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FFA05C3F8;
	Wed, 25 Mar 2020 08:02:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1167086382;
	Wed, 25 Mar 2020 08:02:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02P82c8O026025 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 04:02:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 752CD2166B2C; Wed, 25 Mar 2020 08:02:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FFB52166B2A
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 08:02:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90BE8185A78F
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 08:02:35 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-158-Cx-DWhvYOmWCLGN1H8JiyA-1; Wed, 25 Mar 2020 04:02:32 -0400
X-MC-Unique: Cx-DWhvYOmWCLGN1H8JiyA-1
IronPort-SDR: OQ2sq/eZXffcws64McNp571OdyUewgZP4aD3Y6xbVUfeJQnase9dKcoy5hx5i60KuhcZWTUFpI
	Gx1QysxM10YZT4X1L/Aadu075D74sFUXlDsjwRxKzZ/sJunAh4+mp396mSNG+D9UMU9u7mhS1f
	Ga/ZqImCVa5HiNrFYyVienIIrqPLtrXDwO+oMD4CuGquy43KZIKwbgmQ474JQp/5fJeFZKCNfO
	/Z19klSYts8Lk3f7Fxy74jpjopVMq/vo4tYKYBDthDqkkpLibrbe3SI1j6fihm6DMYYov0ZTSr
	vgI=
X-IronPort-AV: E=Sophos;i="5.72,303,1580745600"; d="scan'208";a="235671313"
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
	by ob1.hgst.iphmx.com with ESMTP; 25 Mar 2020 16:02:37 +0800
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
	by CO2PR04MB2245.namprd04.prod.outlook.com (2603:10b6:102:6::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18;
	Wed, 25 Mar 2020 08:02:30 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2835.023;
	Wed, 25 Mar 2020 08:02:30 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Bob Liu <bob.liu@oracle.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [RFC PATCH v2 3/3] dm zoned: add regular device info to metadata
Thread-Index: AQHWAcvtLt+lRR39/UysINFCEirB8Q==
Date: Wed, 25 Mar 2020 08:02:30 +0000
Message-ID: <CO2PR04MB23439B5FA88275A80D3449DFE7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <20200324110255.8385-1-bob.liu@oracle.com>
	<20200324110255.8385-4-bob.liu@oracle.com>
	<CO2PR04MB23438E0AB35CC46732F96085E7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
	<812da9e9-cfd2-ea24-60cb-4af48f476079@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 261764b7-943e-44b9-86f9-08d7d092de29
x-ms-traffictypediagnostic: CO2PR04MB2245:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO2PR04MB22457A6A1DC9969C6E433DA7E7CE0@CO2PR04MB2245.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(186003)(8936002)(55016002)(66556008)(9686003)(91956017)(26005)(4326008)(66476007)(66946007)(76116006)(64756008)(81166006)(52536014)(5660300002)(81156014)(53546011)(66446008)(8676002)(86362001)(2906002)(6506007)(478600001)(33656002)(54906003)(316002)(7696005)(71200400001)(110136005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CO2PR04MB2245;
	H:CO2PR04MB2343.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xQ0ba4CmiR9PbGfqVb9QTA+yyHrP/BUYT8ITe62r07J/MR31u89R7KvQ6lsP0P17RteUdoXqg8hFs397CxLTw15Sjt/8xnzgaYyhVyW/ZAWuexlmkEwciMY+T5lJiH4p5m9+OohIR2JHOGkm1TjOE3XSQ0FisbssLSi+mMpJMX+FIDkpCTXQaAHzRP85qBA+Jg6+dtYRKJpyk9Z8tXEnihfxiBB14QxW6xYuNJQjOgKNu/1Re+vxGTCKjBjwtpmXaJqaLK2fHms4zsNjbEC6xlN9Xw9Wn8kvpaNaqVkjRKUwKIaVS4jul0mnx/DjaT3STQif6ypcaa9i/tH5UCQPBYgfASf7dPHfkQbOUnzF8HD8/werm2Nef2jLZbfR6ucJ5ID7/4VJeiq/484wpgBV/dt6/TeBMCeRDVO9v4aRZ8LWcpnD0R2zc4147/Hh0HX6
x-ms-exchange-antispam-messagedata: DAnee2Lm69tIZPJoCGA8Fr2c4GyisHJkldnl7iaEhAgtLOV00Td90iTVviMswwo7H7z2Ce3KQch3eOUoYwVYSLDz30CffZsdCPrsazvQKV0MedEWPMbGr0pINu/QBDETmHbqawEpRV+E1fbz28OrWA==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 261764b7-943e-44b9-86f9-08d7d092de29
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 08:02:30.6371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EPx1+SAdikkw2hSBu8/+7a0yhtDuxCVoRaDM09PO8rwZJO4s1A9sUS+/tmwOb9BJ71+VBPcE0bXYNd6zmA6BJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2245
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02P82c8O026025
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Fomichev <Dmitry.Fomichev@wdc.com>, Dmitry
Subject: Re: [dm-devel] [RFC PATCH v2 3/3] dm zoned: add regular device info
	to metadata
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/03/25 15:47, Hannes Reinecke wrote:
> On 3/25/20 7:29 AM, Damien Le Moal wrote:
>> On 2020/03/24 20:04, Bob Liu wrote:
>>> This patch implemented metadata support for regular device by:
>>>   - Emulated zone information for regular device.
>>>   - Store metadata at the beginning of regular device.
>>>
>>>       | --- zoned device --- | -- regular device ||
>>>       ^                      ^
>>>       |                      |Metadata
>>> zone 0
>>>
>>> Signed-off-by: Bob Liu <bob.liu@oracle.com>
>>> ---
>>>   drivers/md/dm-zoned-metadata.c | 135 +++++++++++++++++++++++++++++++----------
>>>   drivers/md/dm-zoned-target.c   |   6 +-
>>>   drivers/md/dm-zoned.h          |   3 +-
>>>   3 files changed, 108 insertions(+), 36 deletions(-)
>>>
> Having thought about it some more, I think we cannot continue with this 
> 'simple' approach.
> The immediate problem is that we lie about the disk size; clearly the
> metadata cannot be used for regular data, yet we expose a target device 
> with the full size of the underlying device.
> Making me wonder if anybody ever tested a disk-full scenario...

Current dm-zoned does not do that... What is exposed as target capacity is
number of chunks * zone size, with the number of chunks being number of zones
minus metadata zones minus number of zones reserved for reclaim. And I did test
disk full scenario (when performance goes to the trash bin because reclaim
struggles...)

> The other problem is that with two devices we need to be able to stitch 
> them together in an automated fashion, eg via a systemd service or udev 
> rule.

Yes, and that has been on my to-do list forever for the current dm-zoned...

> But for this we need to be able to identify the devices, which means 
> both need to carry metadata, and both need to have unique identifier 
> within the metadata. Which the current metadata doesn't allow to.
> 
> Hence my plan is to implement a v2 metadata, carrying UUIDs for the dmz 
> set _and_ the component device. With that we can update blkid to create 
> links etc so that the devices can be identified in the system.
> Additionally I would be updating dmzadm to write the new metadata.

Yep. I think that is needed. And the metadata for the disk that does not store
the mapping tables and bitmaps can be read-only at run time, that is a super
block only holding identification/UUID.

> And I will add a new command 'start' to dmzadm which will then create 
> the device-mapper device _with the correct size_. It also has the 
> benefit that we can create the device-mapper target with the UUID 
> specified in the metadata, so the persistent device links will be 
> created automatically.

The size now should be correct with single device current setup.

> 
> Bob, can you send me your improvements to dmzadm so that I can include 
> them in my changes?
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

