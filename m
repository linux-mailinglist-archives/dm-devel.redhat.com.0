Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id B64561924ED
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 11:02:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585130557;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TQebDPXx/JU49yB2ZsUbXc7u3XKqydYXuONzPggYN94=;
	b=P7d/gHRqCxCFFbTfhB8xq562CUQzu6uPMzkpqgklSU/Mzb3fy3JUVtQhJoKYTEF4F8BDk6
	9gZ9OyjPyVtxsMfXeJNtQBi6ce6dSjXZ9V57wsmc9/3kkqjZduMavgmMNIfup/tfkATAST
	XQ6VeR3viDk40v8GVwMlZKMjJIy3IZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-A_19gwFINRyC8jmOJy8EfA-1; Wed, 25 Mar 2020 06:02:35 -0400
X-MC-Unique: A_19gwFINRyC8jmOJy8EfA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B44E8010EA;
	Wed, 25 Mar 2020 10:02:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16C6D5DA7C;
	Wed, 25 Mar 2020 10:02:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C1FC18089C8;
	Wed, 25 Mar 2020 10:02:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02PA2LG6032323 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 06:02:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 838BA2166B2C; Wed, 25 Mar 2020 10:02:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E91B2166B2A
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 10:02:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9933D8007B3
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 10:02:19 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-110-nDTPi6HBMIi8TnPLhPesuQ-1; Wed, 25 Mar 2020 06:02:17 -0400
X-MC-Unique: nDTPi6HBMIi8TnPLhPesuQ-1
IronPort-SDR: vmeoFQl61XZ0wk6dZ0elULDic44zubKDT20aKmELKCwG8wjoI39twfl7enVbUjtmKl6GkVpkl5
	9TnANp56lPy/uaHdHVNARo1qCH8JA2v3s3qu8KdFQq+g/bwDZl387om9E7AQxroTV65Mn6o46x
	lqHKLVsktM0f0xy1bNxdGN7nj3WKdG7DZm00Wn3DBHGZ3HbelkR2u7xLzK1+2HR7VwJs094gIg
	yxd9ptvnUrfRu6dt8PVH4xZlU7LP+vTKUvpkCKMuRDzAD689sNF8QyVC6sl2AP/cT9BhcuJimX
	Y6U=
X-IronPort-AV: E=Sophos;i="5.72,303,1580745600"; d="scan'208";a="235679185"
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
	NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
	by ob1.hgst.iphmx.com with ESMTP; 25 Mar 2020 18:02:30 +0800
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
	by CO2PR04MB2213.namprd04.prod.outlook.com (2603:10b6:102:a::7) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22;
	Wed, 25 Mar 2020 10:02:13 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2835.023;
	Wed, 25 Mar 2020 10:02:13 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Bob Liu <bob.liu@oracle.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [RFC PATCH v2 3/3] dm zoned: add regular device info to metadata
Thread-Index: AQHWAcvtLt+lRR39/UysINFCEirB8Q==
Date: Wed, 25 Mar 2020 10:02:13 +0000
Message-ID: <CO2PR04MB2343054E74EEDFC330FD98DAE7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <20200324110255.8385-1-bob.liu@oracle.com>
	<20200324110255.8385-4-bob.liu@oracle.com>
	<CO2PR04MB23438E0AB35CC46732F96085E7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
	<812da9e9-cfd2-ea24-60cb-4af48f476079@suse.de>
	<CO2PR04MB23439B5FA88275A80D3449DFE7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
	<0bd2daa1-abbf-681d-405c-f7e4aecd577c@suse.de>
	<CO2PR04MB23433CAD26D492654041FCDCE7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
	<cdf003a6-b0c8-30c0-edc3-049471a7a2b0@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: af357e54-f2d9-425b-59bf-08d7d0a39786
x-ms-traffictypediagnostic: CO2PR04MB2213:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO2PR04MB2213C9A538D8DE217F0091C9E7CE0@CO2PR04MB2213.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(54906003)(110136005)(81156014)(316002)(81166006)(76116006)(26005)(91956017)(66556008)(64756008)(66476007)(66946007)(71200400001)(8936002)(5660300002)(66446008)(86362001)(186003)(52536014)(478600001)(53546011)(8676002)(2906002)(7696005)(4326008)(33656002)(9686003)(6506007)(55016002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CO2PR04MB2213;
	H:CO2PR04MB2343.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c4H0EwKgFWtqeUoYn9QCg59szNd/IAU0u498snczJngSlUhPqVFVVcWjrDPyoefAJOY9lGueQpCmdjOtXDA9LptCsubNyjuXDyfhANwuPRhnmmNxiYQte7U+ceYSAm5Ig8jaBIAw0ZFqeIQrDzShCBkg9WABBhw8kn9+rsdTaosxU2rUv83VgS8COcHxMRhHp+at8Qoxhox88ARkhEzijjIaXG0tQuXema0f251M3oDwuxmrMu/1CXIuRPc4EeuZhuLJ6+5H+sgpeEb63oCycISlaNVcQQXgibibNYlkrQy9pzpDE99zxiIp4npbpmdjwzgErcrZYxbYRF/VFvrBZDzOY2Nw2JGxBr3whYcZw6XthdBdm+SREnDBR4eXbA8m8vG2ugM6aZexZOUMRiUvXtUrNNd8DGCvCrRL70ACRFd2xj/zyKiV8gxJuCjkXWnk
x-ms-exchange-antispam-messagedata: raTsWq/VwhFWaqMU4VigiFxdnUJdF2yFf7a5WDvYWX0lWVkT3d5abYEPeSQjHZ91ay8PxeKemIHRZbx8s2TispPqqSa0GU9+SYYIGE6E/4A1gJOddZWS0n5T5cl6kbxbXejglGXaTuXPGMuYNf2EWA==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af357e54-f2d9-425b-59bf-08d7d0a39786
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 10:02:13.5396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: umHUDhVQL7d0VTK6PGzuiMIKUKfexTtcqceTObwq5mCHpXIaZkdifUXl367FmOGWI+Rac90EOpaOyri2yQkulw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2213
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02PA2LG6032323
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/03/25 19:00, Hannes Reinecke wrote:
> On 3/25/20 10:10 AM, Damien Le Moal wrote:
>> On 2020/03/25 17:52, Hannes Reinecke wrote:
>>> On 3/25/20 9:02 AM, Damien Le Moal wrote:
>>>> On 2020/03/25 15:47, Hannes Reinecke wrote:
>>>>> On 3/25/20 7:29 AM, Damien Le Moal wrote:
>>>>>> On 2020/03/24 20:04, Bob Liu wrote:
>>>>>>> This patch implemented metadata support for regular device by:
>>>>>>>     - Emulated zone information for regular device.
>>>>>>>     - Store metadata at the beginning of regular device.
>>>>>>>
>>>>>>>         | --- zoned device --- | -- regular device ||
>>>>>>>         ^                      ^
>>>>>>>         |                      |Metadata
>>>>>>> zone 0
>>>>>>>
>>>>>>> Signed-off-by: Bob Liu <bob.liu@oracle.com>
>>>>>>> ---
>>>>>>>     drivers/md/dm-zoned-metadata.c | 135 +++++++++++++++++++++++++++++++----------
>>>>>>>     drivers/md/dm-zoned-target.c   |   6 +-
>>>>>>>     drivers/md/dm-zoned.h          |   3 +-
>>>>>>>     3 files changed, 108 insertions(+), 36 deletions(-)
>>>>>>>
>>>>> Having thought about it some more, I think we cannot continue with this
>>>>> 'simple' approach.
>>>>> The immediate problem is that we lie about the disk size; clearly the
>>>>> metadata cannot be used for regular data, yet we expose a target device
>>>>> with the full size of the underlying device.
>>>>> Making me wonder if anybody ever tested a disk-full scenario...
>>>>
>>>> Current dm-zoned does not do that... What is exposed as target capacity is
>>>> number of chunks * zone size, with the number of chunks being number of zones
>>>> minus metadata zones minus number of zones reserved for reclaim. And I did test
>>>> disk full scenario (when performance goes to the trash bin because reclaim
>>>> struggles...)
>>>>
>>> Thing is, the second number for the dmsetup target line is _supposed_ to
>>> be the target size.
>>> Which clearly is wrong here.
>>> I must admit I'm not sure what device-mapper will do with a target
>>> definition which is larger than the resulting target device ...
>>> Mike should know, but it's definitely awkward.
>>
>> AHh. OK. Never thought of it like this, especially considering the fact that the
>> table entry is checked to see if the entire drive is given. So instead of the
>> target size, I was in fact using the size parameter of dmsetup as the size to
>> use on the backend, which for dm-zoned must be the device capacity...
>>
>> Not sure if we can fix that now ? Especially considering that the number of
>> reserved seq zones for reclaim is not constant but a dmzadm format option. So
>> the average user would have to know exactly the useable size to dmsetup the
>> target. Akward too, or rather, not super easy to use. I wonder how dm-thin or
>> other targets with metadata handle this ? Do they format themselves
>> automatically on dmsetup using the size specified ?
>>
> Which is _precisely_ why I want to have the 'start' option to dmzadm.
> That can read the metadata, validate it, and then generate the correct 
> invocation for device-mapper.
> _And_ we get a device-uuid to boot, as this can only be set from the ioctl.

OK. Got it. Done like this, it will also be easy to support the v1 metadata.

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

