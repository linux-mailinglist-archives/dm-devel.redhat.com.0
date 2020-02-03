Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 30A0A15091F
	for <lists+dm-devel@lfdr.de>; Mon,  3 Feb 2020 16:07:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580742462;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=gAFNndHP/yqAQuPpFOM75ezHUHr0w+6cZo8RLwxbsnQ=;
	b=EsgYvb0pwLzUSKE2LY1xgY71p3SSTgQ3xfwUHpc2sr14+KOb1ntEKrccOHvsvNc8hLbVb5
	cmOtUc621G9vvr6zFEhgqQ/cd5h2xsjwix7Wa3ekLX+2i7P99lIwHL7ogW2nj37Yqq0MNY
	+nVVx+rzCenzFIE8HnSLHVAxjV+QUQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-NgnyAVddNy2Gbtkk5EXcHA-1; Mon, 03 Feb 2020 10:07:38 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 338838C7AA9;
	Mon,  3 Feb 2020 15:07:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2BB286C4A;
	Mon,  3 Feb 2020 15:07:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD11B18089C8;
	Mon,  3 Feb 2020 15:07:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 013F74pE011718 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 3 Feb 2020 10:07:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3F239A4867; Mon,  3 Feb 2020 15:07:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38E64A7FC9
	for <dm-devel@redhat.com>; Mon,  3 Feb 2020 15:07:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2ED1D10197EC
	for <dm-devel@redhat.com>; Mon,  3 Feb 2020 15:07:02 +0000 (UTC)
IronPort-SDR: vDhilGK5ct0qDlBHJy+3SP+uj0664bOWwf+lhzqbjI57PlCEha7p6ds0j0Xfp0Xg7TQxnLz3RX
	d64pDv7uQM9eP09ndIwWcsQ7QroTxX683ihp0C/+U1d/LFzG9wM9KK2kKeBfnZotxtYTgJ0NXc
	1u4dhYmr2+fzhML9CmUZ5T6959/d17H+kAmcQFpDmzKinduFXL+bXHqZoOI8LIRl6uTKPuj1i9
	EU6XqTJyYqjEDUpAZdbmZrEbVS21FxZtiDHC7DzEbGK3Cq2JBu7Orxbbn+Run/e4UAxyzJedW8
	p/U=
X-IronPort-AV: E=Sophos;i="5.70,398,1574092800"; d="scan'208";a="129535854"
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-95-9B2ONElFMwe0PUK3UFl10g-1; Mon, 03 Feb 2020 10:06:54 -0500
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
	by ob1.hgst.iphmx.com with ESMTP; 03 Feb 2020 23:06:26 +0800
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
	BYAPR04MB5926.namprd04.prod.outlook.com (20.179.59.214) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2686.26; Mon, 3 Feb 2020 15:06:24 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::cd8e:d1de:e661:a61]) by BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::cd8e:d1de:e661:a61%5]) with mapi id 15.20.2686.028;
	Mon, 3 Feb 2020 15:06:24 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [RFC PATCH] dm-zoned: extend the way of exposing zoned block
	device
Thread-Index: AQHVxfMPtnSx9ygQV0yw4PguyV00/g==
Date: Mon, 3 Feb 2020 15:06:16 +0000
Message-ID: <BYAPR04MB5816B2967735225FB37D627BE7000@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20200108071212.27230-1-Nobody@nobody.com>
	<BYAPR04MB5816BA749332D2FC6CE3993AE73E0@BYAPR04MB5816.namprd04.prod.outlook.com>
	<c4ba178c-f5cf-4dd1-784b-e372d6b09f62@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0aff8644-61d6-4d15-e945-08d7a8baa286
x-ms-traffictypediagnostic: BYAPR04MB5926:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB592608C940F0193A1A98545DE7000@BYAPR04MB5926.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0302D4F392
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(189003)(199004)(478600001)(7696005)(33656002)(4326008)(186003)(81156014)(8676002)(26005)(5660300002)(53546011)(6506007)(6666004)(71200400001)(2906002)(52536014)(81166006)(110136005)(54906003)(91956017)(76116006)(55016002)(8936002)(66946007)(316002)(86362001)(9686003)(64756008)(66556008)(66476007)(66446008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5926;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MPj1YlpEHmTX06juDD074v6ytP+Uz/IBaO/BgLjJ3KlKQq2zSMTqCLQ+lKezwBpabbGA1iicgOqX9JMKSYrK9ztiykhJUPbK8hbK4CG9CHig/0ogYk1Y6obpKYIZqLnjyvT/zM/EBJkTwOVZSduTTtph/hIv1K4ZyzCMgH+//InJnIahtcJ7oShhQkjC9JvDZQQbCH/KYQpiTGFoIrt+UhU/eoqcbvcOpa8c90W5cWbinzuYKmw5PGrArXvkw7f5MJUOjXhDft4LYiqsFS2Ayty0gjlpLYrhCAz0T0uqb8rCdn4Gk2SkjhunLI7xSXwZ5pTy2No8Kf0HISZlTxRksh/c6Ygk6WiKyf0iUkXZWIXdgupTn4rzl7tbPSjzFIP4Clp+HesakhCTWVhvMmpcHOVmzG0PE9v9XEx/U9qXL06ykU6Pia8F/us2XK4PETm/
x-ms-exchange-antispam-messagedata: LOAdozyFNR102piNLsaS7pI5puZr5DAh3tYJ16oL22mE4VMWdtmg6iQ9a0tPuagicF+5cCxQpQeeUVn3ntOzRTFkhwCIGiw7IHYTDj4Ua7fKKvFcmaIiVE/kvBQsZknj9Dd2ngjujq1DkYd2bMZteg==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aff8644-61d6-4d15-e945-08d7a8baa286
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2020 15:06:16.8888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CWhKnZxok2kb81Oy/N3S55Lfe9irAZ90MWb+uHyP6YVq/7MwvyS3uIyj1/cmBnGtVD7b3aYZVmcf6WynVaWtZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5926
X-MC-Unique: 9B2ONElFMwe0PUK3UFl10g-1
X-MC-Unique: NgnyAVddNy2Gbtkk5EXcHA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 013F74pE011718
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/02/03 21:47, Bob Liu wrote:
> On 1/8/20 3:40 PM, Damien Le Moal wrote:
>> On 2020/01/08 16:13, Nobody wrote:
>>> From: Bob Liu <bob.liu@oracle.com>
>>>
>>> Motivation:
>>> Now the dm-zoned device mapper target exposes a zoned block device(ZBC) as a
>>> regular block device by storing metadata and buffering random writes in
>>> conventional zones.
>>> This way is not very flexible, there must be enough conventional zones and the
>>> performance may be constrained.
>>> By putting metadata(also buffering random writes) in separated device we can get
>>> more flexibility and potential performance improvement e.g by storing metadata
>>> in faster device like persistent memory.
>>>
>>> This patch try to split the metadata of dm-zoned to an extra block
>>> device instead of zoned block device itself.
>>> (Buffering random writes also in the todo list.)
>>>
>>> Patch is at the very early stage, just want to receive some feedback about
>>> this extension.
>>> Another option is to create an new md-zoned device with separated metadata
>>> device based on md framework.
>>
>> For metadata only, it should not be hard at all to move to another
>> conventional zone device. It will however be a little more tricky for
>> conventional zones used for data since dm-zoned assumes that this random
>> write space is also zoned. Moving this space to a conventional device
>> requires implementing a zone emulation (fake zones) for the regular
>> drive, using a zone size that matches the size of sequential zones.
>>
>> Beyond this, dm-zoned also needs to be changed to accept partial drives
>> and the dm core code to accept mixing of regular and zoned disks (that
>> is forbidden now).
>>
>> Another approach worth exploring is stacking dm-zoned as is on top of a
>> modified dm-linear with the ability to emulate conventional zones on top
>> of a regular block device (you only need report zones method
>> implemented). 
> 
> Looks like the only way to do this emulation is in user space tool(dm-zoned-tools).
> Write metadata(which contains emulated zone information constructed by dm-zoned-tools)
> into regular block device.

User space tool will indeed need some modifications to allow the new
format. But I would not put this as "doing the emulation" since at that
level, zones are only an information checked for alignment of metadata
space and overall capacity of the target. With a regular disk holding the
metadata, all that needs to be done is assume that this drive is ion fact
composed solely of conventional zones with the same size as the larger SRM
disk backend. The total set of zones "assumed" + "real zones from SMR"
consitute the set of zones that dmzadm will work with for determining the
overall format, while currently it only uses the set of real zones.

> It's impossible to add code to every regular block device for emulating conventional zones. 

There is no need to do that. dm-zoned can emulate fake conventional zones
for the regular device (disk or ssd) holding the metadata. Since
conventional zones do not have any IO restriction nor do they need any zone
management command (no zone reset), dm-zoned only needs to create a set of
struct dm_zone for the emulated zones of the regular disk and "manually"
fill the zone information. This initialization is done in dmz_init_zones().
Some changes there to create these struct dm_zone and all the remaining
metadata and write buffering code should not need any change at all (modulo
the different bdev reference). Do you see the idea ?

The only place that will need some care is sync processing as 2 devices
will need to be issued flushes instead of one. The reference to the
different bdev depending on the zone being accessed will need some care in
many places too, including reclaim. But dm-kcopy being used there, this
should be fairly easy.

Adding a bdevid (an index) field to struct dm_zone, together with an array
of bdev pointers in struct dmz_dev, should do the trick to simplify
zone-to-bdev or block-to-bdev conversions (helper functions needed for that).

Thoughts ?

> 
> Thanks,
> Bob
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

