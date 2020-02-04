Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 54F5F151715
	for <lists+dm-devel@lfdr.de>; Tue,  4 Feb 2020 09:32:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580805162;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=4OugUMNu1dNvVmmqoxHMEe5iqAXvTl8Dn941z0pHsHY=;
	b=afho7K3JokMO+hYHxKxRpsjqVxZH46LJg5K0QmBReE8S0gDJw7tWxd/iF8DiPILlmfyD0+
	upEvUMqLCimDwCv6HILUTpdttEL1N4uW0rF9v8Cvj43OSUQbyK6gLkSrEI5hUH9ibSFejJ
	vm3FeHh3X4I1I9ZxDWnXvcRSFpruCao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-rshAGPbiOguRGkjduK5Tow-1; Tue, 04 Feb 2020 03:32:39 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7220E800D55;
	Tue,  4 Feb 2020 08:32:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0093E1001920;
	Tue,  4 Feb 2020 08:32:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 427718173F;
	Tue,  4 Feb 2020 08:32:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0148W8v9008010 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Feb 2020 03:32:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3C8C410F1BEC; Tue,  4 Feb 2020 08:32:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3637010F1BE6
	for <dm-devel@redhat.com>; Tue,  4 Feb 2020 08:32:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A267E8EB472
	for <dm-devel@redhat.com>; Tue,  4 Feb 2020 08:32:05 +0000 (UTC)
IronPort-SDR: G4ABP2NAAFSm08hKAi6GnjCDENGgc6wCCAElazrweMze3G15y4kchCC0Ncji8/V+nM1CtKORNh
	Q22MiFRiWYAA6MuI3o6GBfWqcj1FS4ovlAzZfbJp57ne7QXt1pNREnx8C0rnZcVwQkxZ5fdRNb
	Cs6i2bPg6OFyintsc6AUGPDnxkIfuc9BD5mOk59bzzr+WSpsouQbhWAE1E2amhxgZA0Rwlzjaa
	jk4Z12RTid0qrjPrxOeZynHLVjtx4rjKTbNwpl/uBXpUvU0NX7KsbsqRqRj+/oxcfphwlu7H62
	K5U=
X-IronPort-AV: E=Sophos;i="5.70,398,1574092800"; d="scan'208";a="237007611"
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-103-VQIViMM5PQOhl51elqzClA-1; Tue, 04 Feb 2020 03:32:02 -0500
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
	by ob1.hgst.iphmx.com with ESMTP; 04 Feb 2020 16:32:00 +0800
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
	BYAPR04MB3893.namprd04.prod.outlook.com (52.135.214.156) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2686.27; Tue, 4 Feb 2020 08:32:00 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::cd8e:d1de:e661:a61]) by BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::cd8e:d1de:e661:a61%5]) with mapi id 15.20.2686.034;
	Tue, 4 Feb 2020 08:32:00 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [RFC PATCH] dm-zoned: extend the way of exposing zoned block
	device
Thread-Index: AQHVxfMPtnSx9ygQV0yw4PguyV00/g==
Date: Tue, 4 Feb 2020 08:31:59 +0000
Message-ID: <BYAPR04MB5816821A996DC2DF7F3830A0E7030@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20200108071212.27230-1-Nobody@nobody.com>
	<BYAPR04MB5816BA749332D2FC6CE3993AE73E0@BYAPR04MB5816.namprd04.prod.outlook.com>
	<c4ba178c-f5cf-4dd1-784b-e372d6b09f62@oracle.com>
	<BYAPR04MB5816B2967735225FB37D627BE7000@BYAPR04MB5816.namprd04.prod.outlook.com>
	<bc772b99-b629-1979-7ce9-b685242b86d0@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [210.160.37.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 41e4ac4d-639a-4abe-d28d-08d7a94cb41b
x-ms-traffictypediagnostic: BYAPR04MB3893:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB3893366455E7EFD38967C59DE7030@BYAPR04MB3893.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03030B9493
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(199004)(189003)(53546011)(2906002)(6506007)(86362001)(7696005)(71200400001)(8676002)(8936002)(81166006)(81156014)(4326008)(54906003)(110136005)(26005)(186003)(52536014)(5660300002)(316002)(33656002)(55016002)(66446008)(76116006)(9686003)(66946007)(64756008)(66556008)(66476007)(478600001)(91956017);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB3893;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IQ4xzug2v24m6YLOxhGLWXzZqe0+tV2fAz5F7piVHzZx/0O6d0fTZ7VRQzEHXhSjR7hBsHBNhvTgJ3Lqs+qXX22ZrcANYQRCMe4obrEMLa6eqC+aFHPQ+mcDFuu/B1XGosCITsLSZWbpGdwKVb+vjLM6vcc4jNnSuEzqcsbWxmgeA2pNKeMk+IsnvfJShahqr92i6d5S4BWaHiU+swujVadGtLDTL1pfPoUrUGQISSqUKJBn25rIAfP0UqMVNkZWlIHuJi6yXF2yPRu2IfMarJ6rRwFoAIsQjWHkQMdrYgxZL2g/Vs2FMZNfFbQemeX0yv07UX+Hnecr43qocpSe1NoryQUxe210jnKvNi7Zmwt6p8+ChxfoBSZfVnSj52cZwI8UcHQ9SG3TWiUMEfBqRc7ySFcbkL2xVL6K7B3v7ibWVbig6EKMoy4KAGu1egOe
x-ms-exchange-antispam-messagedata: EpLv3sbW7P7erMO1tUfPScP4w085b60WTFnIjhHsycmPKELoNdJnGNyCeWUBMwFT3dgfEtWt35fCmfsE+UxKwdvASvbwTDfvnC4SgY8s3meqlWmboRPAa5yRu6FcS1hphOXjcRF/qu50Zs8qf2ctQA==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e4ac4d-639a-4abe-d28d-08d7a94cb41b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2020 08:31:59.8716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H1Hhdv/a1x0T3W1Aqg+cmUu6sroB5vaA8K0MKiGwz9Mm5dW95Uix6ZqmD/Jec7POqkz1AabkBbBS4faAxRVsAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3893
X-MC-Unique: VQIViMM5PQOhl51elqzClA-1
X-MC-Unique: rshAGPbiOguRGkjduK5Tow-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0148W8v9008010
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH] dm-zoned: extend the way of exposing
 zoned block device
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/02/04 12:57, Bob Liu wrote:
> On 2/3/20 11:06 PM, Damien Le Moal wrote:
>> On 2020/02/03 21:47, Bob Liu wrote:
>>> On 1/8/20 3:40 PM, Damien Le Moal wrote:
>>>> On 2020/01/08 16:13, Nobody wrote:
>>>>> From: Bob Liu <bob.liu@oracle.com>
>>>>>
>>>>> Motivation:
>>>>> Now the dm-zoned device mapper target exposes a zoned block device(ZBC) as a
>>>>> regular block device by storing metadata and buffering random writes in
>>>>> conventional zones.
>>>>> This way is not very flexible, there must be enough conventional zones and the
>>>>> performance may be constrained.
>>>>> By putting metadata(also buffering random writes) in separated device we can get
>>>>> more flexibility and potential performance improvement e.g by storing metadata
>>>>> in faster device like persistent memory.
>>>>>
>>>>> This patch try to split the metadata of dm-zoned to an extra block
>>>>> device instead of zoned block device itself.
>>>>> (Buffering random writes also in the todo list.)
>>>>>
>>>>> Patch is at the very early stage, just want to receive some feedback about
>>>>> this extension.
>>>>> Another option is to create an new md-zoned device with separated metadata
>>>>> device based on md framework.
>>>>
>>>> For metadata only, it should not be hard at all to move to another
>>>> conventional zone device. It will however be a little more tricky for
>>>> conventional zones used for data since dm-zoned assumes that this random
>>>> write space is also zoned. Moving this space to a conventional device
>>>> requires implementing a zone emulation (fake zones) for the regular
>>>> drive, using a zone size that matches the size of sequential zones.
>>>>
>>>> Beyond this, dm-zoned also needs to be changed to accept partial drives
>>>> and the dm core code to accept mixing of regular and zoned disks (that
>>>> is forbidden now).
>>>>
>>>> Another approach worth exploring is stacking dm-zoned as is on top of a
>>>> modified dm-linear with the ability to emulate conventional zones on top
>>>> of a regular block device (you only need report zones method
>>>> implemented). 
>>>
>>> Looks like the only way to do this emulation is in user space tool(dm-zoned-tools).
>>> Write metadata(which contains emulated zone information constructed by dm-zoned-tools)
>>> into regular block device.
>>
>> User space tool will indeed need some modifications to allow the new
>> format. But I would not put this as "doing the emulation" since at that
>> level, zones are only an information checked for alignment of metadata
>> space and overall capacity of the target. With a regular disk holding the
>> metadata, all that needs to be done is assume that this drive is ion fact
>> composed solely of conventional zones with the same size as the larger SRM
>> disk backend. The total set of zones "assumed" + "real zones from SMR"
>> consitute the set of zones that dmzadm will work with for determining the
>> overall format, while currently it only uses the set of real zones.
>>
>>> It's impossible to add code to every regular block device for emulating conventional zones. 
>>
>> There is no need to do that. dm-zoned can emulate fake conventional zones
> 
> Oh, what I intend to say is it's impossible adding "BLKREPORTZONE" to regular block device driver.
> We have to construct fake zone information for regular device all by dmzadm, based on current information
> we can get from regular device.

OK. We are in sync. I misunderstood you. Yes, there is no need to emulate
completely a zone disk at the driver level. dmzadm (and dm-zoned module)
can generate a list of fake conventional zones very easily for the regular
drive.

> 
> $ dmzadm --format `regular device` `real zoned device` --force 
> 
>> for the regular device (disk or ssd) holding the metadata. Since
>> conventional zones do not have any IO restriction nor do they need any zone
>> management command (no zone reset), dm-zoned only needs to create a set of
>> struct dm_zone for the emulated zones of the regular disk and "manually"
>> fill the zone information. This initialization is done in dmz_init_zones().
>> Some changes there to create these struct dm_zone and all the remaining
>> metadata and write buffering code should not need any change at all (modulo
>> the different bdev reference). Do you see the idea ?
>>
>> The only place that will need some care is sync processing as 2 devices
>> will need to be issued flushes instead of one. The reference to the
>> different bdev depending on the zone being accessed will need some care in
>> many places too, including reclaim. But dm-kcopy being used there, this
>> should be fairly easy.
>>
>> Adding a bdevid (an index) field to struct dm_zone, together with an array
>> of bdev pointers in struct dmz_dev, should do the trick to simplify
>> zone-to-bdev or block-to-bdev conversions (helper functions needed for that).
>>
>> Thoughts ?
>>
> 
> Thank you for all these suggestions.
> 
> Regards,
> Bob
> 
> 
> 
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

