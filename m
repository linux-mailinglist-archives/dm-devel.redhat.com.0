Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 93851321264
	for <lists+dm-devel@lfdr.de>; Mon, 22 Feb 2021 09:54:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-YqUACaX4Pmmt8cl231Yz-A-1; Mon, 22 Feb 2021 03:54:25 -0500
X-MC-Unique: YqUACaX4Pmmt8cl231Yz-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D36D685EE66;
	Mon, 22 Feb 2021 08:54:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0DD35D9D0;
	Mon, 22 Feb 2021 08:54:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6AB8058075;
	Mon, 22 Feb 2021 08:54:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11KI26gU021005 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 20 Feb 2021 13:02:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BF5851111A79; Sat, 20 Feb 2021 18:02:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA7531111A78
	for <dm-devel@redhat.com>; Sat, 20 Feb 2021 18:02:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DAA7858F0E
	for <dm-devel@redhat.com>; Sat, 20 Feb 2021 18:02:03 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [207.82.80.151]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-316-fIlDpwfCPcO0Z2VkSOCUng-1;
	Sat, 20 Feb 2021 13:02:01 -0500
X-MC-Unique: fIlDpwfCPcO0Z2VkSOCUng-1
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-246-SoJwM6GlPY20W1KbkIBHGQ-1; Sat, 20 Feb 2021 18:01:58 +0000
X-MC-Unique: SoJwM6GlPY20W1KbkIBHGQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft
	SMTP Server (TLS) id 15.0.1347.2; Sat, 20 Feb 2021 18:01:57 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
	AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id
	15.00.1347.000; Sat, 20 Feb 2021 18:01:57 +0000
From: David Laight <David.Laight@aculab.com>
To: "'SelvaKumar S'" <selvakuma.s1@samsung.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>
Thread-Topic: [RFC PATCH v5 0/4] add simple copy support
Thread-Index: AQHXByyi0XMTfmzR3kSGd6ttkW2CGaphVhLg
Date: Sat, 20 Feb 2021 18:01:56 +0000
Message-ID: <146c47907c2446d4a896830de400dd81@AcuMS.aculab.com>
References: <CGME20210219124555epcas5p1334e7c4d64ada5dc4a2ca0feb48c1d44@epcas5p1.samsung.com>
	<20210219124517.79359-1-selvakuma.s1@samsung.com>
In-Reply-To: <20210219124517.79359-1-selvakuma.s1@samsung.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11KI26gU021005
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 22 Feb 2021 03:49:50 -0500
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
	"damien.lemoal@wdc.com" <damien.lemoal@wdc.com>,
	"kch@kernel.org" <kch@kernel.org>, "sagi@grimberg.me" <sagi@grimberg.me>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"selvajove@gmail.com" <selvajove@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"nj.shetty@samsung.com" <nj.shetty@samsung.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"joshi.k@samsung.com" <joshi.k@samsung.com>,
	"javier.gonz@samsung.com" <javier.gonz@samsung.com>,
	"kbusch@kernel.org" <kbusch@kernel.org>,
	"joshiiitr@gmail.com" <joshiiitr@gmail.com>, "hch@lst.de" <hch@lst.de>
Subject: Re: [dm-devel] [RFC PATCH v5 0/4] add simple copy support
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: SelvaKumar S
> Sent: 19 February 2021 12:45
> 
> This patchset tries to add support for TP4065a ("Simple Copy Command"),
> v2020.05.04 ("Ratified")
> 
> The Specification can be found in following link.
> https://nvmexpress.org/wp-content/uploads/NVM-Express-1.4-Ratified-TPs-1.zip
> 
> Simple copy command is a copy offloading operation and is  used to copy
> multiple contiguous ranges (source_ranges) of LBA's to a single destination
> LBA within the device reducing traffic between host and device.

Sounds to me like the real reason is that the copy just ends up changing
some indirect block pointers rather than having to actually copy the data.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

