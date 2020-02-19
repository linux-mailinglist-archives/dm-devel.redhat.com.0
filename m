Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 79094163FE5
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 10:02:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582102936;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=laty4CG0TQ/74TpB81vLx3PjWySmi0VcmLR9eIIPnfQ=;
	b=C7Z8eM4gU2bGFe8eXLvwYe9q9gh98Kcg9p5AfodgWwYxD3/Ly+RDVWpmNF9OkwfF54DSG5
	VySf8tDRi7GNFd4wtliYFo9ucmJcrGg4bf+0YmRvxUJ4vnw8baBKwwGkK1Qn3eBw+KcYGz
	esJM1nwjR9W4+/+/QuIIUlzVqHC49zg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-eJMlpv4eMgCGcx6hgiJRUQ-1; Wed, 19 Feb 2020 04:02:12 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 380E2189F769;
	Wed, 19 Feb 2020 09:02:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 138A8196AE;
	Wed, 19 Feb 2020 09:02:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D5DE135B0C;
	Wed, 19 Feb 2020 09:01:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J91bwi024951 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 04:01:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D2FBD2166B27; Wed, 19 Feb 2020 09:01:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC1BE2166B29
	for <dm-devel@redhat.com>; Wed, 19 Feb 2020 09:01:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FF3286D70C
	for <dm-devel@redhat.com>; Wed, 19 Feb 2020 09:01:35 +0000 (UTC)
Received: from m9a0013g.houston.softwaregrp.com
	(m9a0013g.houston.softwaregrp.com [15.124.64.91]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-369-vchGlu7AM5mzWdnsCz2RFA-1;
	Wed, 19 Feb 2020 04:01:31 -0500
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0013g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 19 Feb 2020 09:00:51 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 19 Feb 2020 08:55:09 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.72.13) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 19 Feb 2020 08:55:09 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (10.175.223.16) by
	DM5PR18MB1083.namprd18.prod.outlook.com (10.168.113.136) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2729.31; Wed, 19 Feb 2020 08:55:08 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1ec:4fbe:928d:8675]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1ec:4fbe:928d:8675%9]) with mapi id 15.20.2750.016;
	Wed, 19 Feb 2020 08:55:08 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v3 00/18] Multipath patch dump
Thread-Index: AQHV5wJJxci/ZiVlCEW7CDGY3AK8PQ==
Date: Wed, 19 Feb 2020 08:55:08 +0000
Message-ID: <b11e466e845185fdf90614d2d3a1c76394973447.camel@suse.com>
References: <1582094920-9883-1-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1582094920-9883-1-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.218.227.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b49d470-ab30-4c3c-15b2-08d7b5196bda
x-ms-traffictypediagnostic: DM5PR18MB1083:
x-microsoft-antispam-prvs: <DM5PR18MB1083421242B844D1E8AAC5DBFC100@DM5PR18MB1083.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(189003)(199004)(86362001)(6512007)(81166006)(81156014)(76116006)(91956017)(186003)(71200400001)(6506007)(2616005)(4326008)(6486002)(66574012)(110136005)(8936002)(5660300002)(36756003)(2906002)(8676002)(316002)(66946007)(64756008)(66476007)(66446008)(66556008)(26005)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1083;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4yRsgRCBWNKIP5Qo2k/Dwch8D7pJJvscSzu1evOvEnjxuq0tZ4DZ50M60/vleB/skyDSPkYUlz1ZEwawAmw9JUvKjx5wSk6HRtznsYbm3sWO/7tPoPR5vPasGPoUyoxYhM37Zw9B860Ic10VBiJCLvfxjQ/hltJx8QVFX2RJJ9jihd/9Zy9J/GTeIaSw/PkFCKARHTRPd9ygBDwWLMuFBtXPHP6e7ITuX+s/KrMbJRJOCFUJieRVpCQoUqVEsm5ihhu3uCOVEh0Z8JBGdVqJqE1aIR1S6dDBrOFdVIAVWOvmbdFx9oO7Zd9P4g3qCrQ9R4oC2TNRuX/D2UoNNfZgDkBKapkJzTu21C6u/gDOuUzB8HiQBUF+u7buFGLfhgaS/v3no6Usu32Wi08iKH07sYjTEkX9UzXKgHc1cgQ2S5ij0TNZyPMfeNbClHfYdR+3
x-ms-exchange-antispam-messagedata: 5vXE0hQ5ZBYPbX4Oec/IepU98XZnxLrZirsrV9sllIObptCWGxHUZYArrNIo/BFU3+57Hfu1av4xjv2BSmVH3UJdAT6qBE+fIuewXpcehQMV+09TkXneudz5w5rtisM7EErx/iXOyGbRTt3h/lt1oA==
x-ms-exchange-transport-forked: True
Content-ID: <2DB6CB099A745543A5690FCFA7FB79B4@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b49d470-ab30-4c3c-15b2-08d7b5196bda
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2020 08:55:08.3739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n8M5GGniVTG+q5YvFGU4g6gKUmDSyTu8sHU587J+WbWJXTnPYVVyaYs69r5UPE7Pa5WZHZI5oZ7khsrXvCJwDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1083
X-OriginatorOrg: suse.com
X-MC-Unique: vchGlu7AM5mzWdnsCz2RFA-1
X-MC-Unique: eJMlpv4eMgCGcx6hgiJRUQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J91bwi024951
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v3 00/18] Multipath patch dump
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-02-19 at 00:48 -0600, Benjamin Marzinski wrote:
> This patch set is has multiple parts.
>=20
> patch 01 is just a resubmit of my previous patch, with Martin's
> corrections added.
>=20
> Patches 02 - 06 are miscellaneous fixes and cleanups
>=20
> Patches 07 - 09 are related to adding a new format wildcard, at the
> =09request of HPE, that allows multipath to get and display
> =09information from the vendor specific VPD pages
>=20
> Patches 10 - 18 are the part that needs the most review, patch 14
> =09especially. It turns out that on machines with a large number
> =09of cores, io_destroy(), which is used by the directio checker,
> =09can take a long time to complete. Talking to some kernel people
> =09at Red Hat, I was told that this isn't a bug. It's working as
> =09expected, and multipath shouldn't be issuing so many
> =09io_destroy() calls (1 per path, when multipath or multipathd
> =09stops). Cutting out the io_destroy calls involved a major
> change
> =09to the directio checker. It's pretty hard to test a lot of the
> =09corner cases on actual hardware, so I've written a bunch of
> =09unit tests for this (patches 16 & 17).
>=20
> Changes in v3:
> This removes the conflicts with Martin's earlier patches,
> specifically
>=20
> 0003-libmultipath-fix-leak-in-foreign-code.patch
> =09removed in favor of Martin's
> =09"libmultipath: _init_foreign(): fix possible memory leak"
> =09patch
>=20
> 0016-fixup-libmultipath-add-code-to-get-vendor-specific-v.patch
> 0017-fixup-libmultipath-make-directio-checker-share-io-co.patch
> =09New patches to fix compile-time errors resulting from the
> =09rebase
>=20
> 0018-tests-make-directio-tests-able-to-work-on-a-real-dev.patch
> =09Fix conflicts between with Martin's earlier patches
>=20
> Changes in v2:
> 0001-multipathd-warn-when-configuration-has-been-changed.patch
> =09Changed to reflect Martin Wilck's comments
>=20
> 0002-multipathd-staticify-uxlsnr-variables-functions.patch
> =09New patch
>=20
> 0008-libmultipath-fix-sgio_get_vpd-looping.patch
> =09Test has been changed to keep create_vpd83 the same, and
> =09overwrite the length in the actual test, as suggested by
> =09Martin Wilck
>=20
> 0010-libmultipath-add-code-to-get-vendor-specific-vpd-dat.patch
> =09The information to find the vpd page and how to decode it is
> =09now simply the index in a table of name -> page_nr mappings
>=20
> 0012-libmultipath-change-failed-path-prio-timeout.patch
> =09The timeout argument has been renamed to avoid confusion,
> =09as suggested by Martin Wilck
>=20
> 0015-libmultipath-make-directio-checker-share-io-contexts.patch
> =09Minor changes to print more useful messages, and avoid
> =09printing anything when we get a non-zero io_cancel()
> =09result, as suggested by Martin Wilck
>=20
> 0016-tests-add-directio-unit-tests.patch
> =09Minor change to improve readability, as suggested by
> =09Martin Wilck
>=20
> 0017-tests-make-directio-tests-able-to-work-on-a-real-dev.patch
> =09New patch. This adds the ability to set a testing device, so
> =09you can run the directio tests on an actual device
>=20
>=20
>=20
> Benjamin Marzinski (16):
>   multipathd: warn when configuration has been changed.
>   multipathd: staticify uxlsnr variables/functions
>   Fix leak in mpathpersist
>   libmultipath: remove unused path->prio_args
>   libmultipath: constify get_unaligned_be*
>   libmultipath: add missing hwe mpe variable merges
>   libmultipath: fix sgio_get_vpd looping
>   libmultipath: add vend_id to get_vpd_sgio
>   libmultipath: add code to get vendor specific vpd data
>   libmultipath: change how the checker async is set
>   libmultipath: change failed path prio timeout
>   multipathd: add new paths under vecs lock
>   libmultipath: add new checker class functions
>   libmultipath: make directio checker share io contexts
>   tests: add directio unit tests
>   tests: make directio tests able to work on a real device
>=20
> Martin Wilck (2):
>   fixup! libmultipath: add code to get vendor specific vpd data
>   fixup! libmultipath: make directio checker share io contexts
>=20
>  libmpathpersist/mpath_persist.c  |   2 +-
>  libmultipath/checkers.c          |  29 +-
>  libmultipath/checkers.h          |   1 +
>  libmultipath/checkers/directio.c | 336 ++++++++++---
>  libmultipath/config.c            |  10 +
>  libmultipath/config.h            |   2 +
>  libmultipath/dict.c              |  38 ++
>  libmultipath/discovery.c         |  80 ++-
>  libmultipath/discovery.h         |   2 +-
>  libmultipath/hwtable.c           |   1 +
>  libmultipath/print.c             |  25 +
>  libmultipath/prio.c              |   6 +-
>  libmultipath/propsel.c           |  20 +-
>  libmultipath/propsel.h           |   1 +
>  libmultipath/structs.h           |  16 +-
>  libmultipath/unaligned.h         |   4 +-
>  mpathpersist/main.c              |   1 +
>  multipath/main.c                 |   1 +
>  multipath/multipath.conf.5       |  15 +-
>  multipathd/main.c                |  18 +-
>  multipathd/uxlsnr.c              | 150 +++++-
>  tests/Makefile                   |  19 +-
>  tests/directio.c                 | 812
> +++++++++++++++++++++++++++++++
>  tests/directio_test_dev          |   4 +
>  tests/vpd.c                      |  87 ++--
>  25 files changed, 1527 insertions(+), 153 deletions(-)
>  create mode 100644 tests/directio.c
>  create mode 100644 tests/directio_test_dev
>=20

ACK for the series.

... one small nit: I'd rather not add the new file
"tests/directio_test_dev" from patch 18/18 to version control (git),
because the file is likely to be different in every environment, and
changes to the file will need to be stashed away before every branch
export, which is inconvenient. "make test" will work just fine without
the file. I'd prefer a tests/README file explaining how to
activate directio-on-real-device testing.

But this is not a reject, Christophe could fix this when merging, or
I'll post a fix.

Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

