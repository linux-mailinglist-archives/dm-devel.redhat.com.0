Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8A1A30BD
	for <lists+dm-devel@lfdr.de>; Fri, 30 Aug 2019 09:19:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A03A669EE0;
	Fri, 30 Aug 2019 07:19:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B4981001938;
	Fri, 30 Aug 2019 07:18:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E986B1806B00;
	Fri, 30 Aug 2019 07:18:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7U7IcXL009301 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 30 Aug 2019 03:18:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D378860C80; Fri, 30 Aug 2019 07:18:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CE4D6107E;
	Fri, 30 Aug 2019 07:18:36 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC3617F767;
	Fri, 30 Aug 2019 07:18:29 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Fri, 30 Aug 2019 07:17:41 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 30 Aug 2019 07:09:31 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.14) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 30 Aug 2019 07:09:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=QeT7Zc5n8EmkoOxilnrMN/kwDM7FFSoEp8nWDLna+yn29WOzT+sU4BePvDgWKLrtK1coBmCx3YZ1QfOxojpyrZxz/+dNY9c5Tgr6EdNDOCRg6Xera6tGFugNAwy6GV7X02I86DIevONp2+zwkUOBLiFZLNVdiSo7TtFOhVPiZpeOgpgKMiHajJA8YswHoa/4hOAlpUUnaKg1Au+irQYgufiKjiy2cLQT30CR3t1iailhxq5x6TdweDMCZd7FOWxPpLZLlf2pEbxNUW6YWabG7GYFdfwHpPK9XaKHTsz01NYP5mPSQ7a0STcxEhunwIpbZErUP6LCXuy6AGcsHVep3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=fL2xf3CFiJzec1LwhdJZ1aBHx8/N/lzaoc4vWANbIfw=;
	b=MszRk5s1cz/RP1GAnOenieS1f2X0UUjSr9GbA7IRcHNw/h1Obo9r8Y2VyoLLt6SQWsuxPWFo7qRzrK4lwsb8Pt73lyI7iBOhjGoldct19qgZ4fRtPBigqtTXV90ktWeom7PDjeMWW7xcBYnhJhhsflDNCO8B5d7s6Acw5SXoX/xkAckULdb866FNRXKMjxo9+mNpjsEdK6jt/mr8rkiv56qHMCcchk7Ui0laAJqeCbwYd2k/2N+NCyr+7YreYH7aoDhfzcIFJXigPy2qy+bkJLlOAAxTAcsl6oqzUZTEiH3AO1/10QrH/uT8nfloLZTTjTr+ShYbDpd7yQRZ6LZ2NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3175.namprd18.prod.outlook.com (52.132.244.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2199.21; Fri, 30 Aug 2019 07:09:25 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::650e:1c23:2bf1:fca8]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::650e:1c23:2bf1:fca8%6]) with mapi id 15.20.2199.021;
	Fri, 30 Aug 2019 07:09:25 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v2 00/14] multipath marginal pathgroups
Thread-Index: AQHVXwHZg19fMP3RqEKZT8aS6iUs3g==
Date: Fri, 30 Aug 2019 07:09:23 +0000
Message-ID: <b98ce7d0112b3b81f1c8ef52bee68f84760de9c1.camel@suse.com>
References: <1566582538-5979-1-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1566582538-5979-1-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [90.186.0.117]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42da5e9d-78d5-4672-f123-08d72d18fd71
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3175; 
x-ms-traffictypediagnostic: CH2PR18MB3175:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CH2PR18MB31752B7A1D1AB4F378BB7C1BFCBD0@CH2PR18MB3175.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(199004)(189003)(4326008)(71200400001)(7736002)(66446008)(305945005)(76176011)(6506007)(81166006)(99286004)(6512007)(81156014)(102836004)(8676002)(6486002)(76116006)(966005)(6436002)(118296001)(14454004)(2906002)(478600001)(316002)(5660300002)(71190400001)(66556008)(229853002)(66946007)(446003)(476003)(6116002)(3846002)(25786009)(2616005)(2501003)(53936002)(8936002)(36756003)(486006)(86362001)(110136005)(66476007)(26005)(186003)(256004)(11346002)(6246003)(64756008)(6306002)(91956017)(14444005)(66066001)(54906003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3175;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: taihReBBFhVf+l15HW1y95kcfOZSy0mXtc9H+nAoW2Gd44qn+2Ne+eo13qMNUctXkV5fGUhF7IaB7VnSkkSqTlGHVWDhG67WAimhIqMy4OoQ0POqTllfuQsku4o1BQ0UMYGbRr10r/Vrm6DPmyzdheV4/AiOVqUfU2Q4uwd2wxvd35DeNJS42gQ70fqQsfgTf5clHVNO83D32NwdgN7TWzuF2d/HfDNfDQWqelm6Qgbsf5d6lWSUYHk/gJOWxanptKD+/dTRBVSdBSnc5Sl+uhkf3h41QL/3BNw8QldVS9UFysks9A79VEOGidX3JUPtAuQYDuFpbaueCB1aB+3aky6l+XMJLIHxClh/+akAGTC2f3FdsQFppJlXZ4ZAOAIij6Z9pQrf9mlIIqIMwKm2do0nLzH8JN3z2RvXnmZ/N5Y=
x-ms-exchange-transport-forked: True
Content-ID: <84EB5DE655A9F640B75EA7BB61EED43B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 42da5e9d-78d5-4672-f123-08d72d18fd71
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 07:09:24.6375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VqY2zeIk2wc1Hz7AxPckZHKD4JC5SeSaFIupWpfTn1OdXw7LviqtNeo7ZUoyfhHq/zB5bDwPMyn58yHPwDRjzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3175
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.71]); Fri, 30 Aug 2019 07:18:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Fri, 30 Aug 2019 07:18:35 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7U7IcXL009301
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 00/14] multipath marginal pathgroups
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Fri, 30 Aug 2019 07:19:03 +0000 (UTC)

On Fri, 2019-08-23 at 12:48 -0500, Benjamin Marzinski wrote:
> The first patch in this series is simply a resend of my previous
> patch
> to fix vector_foreach_slot_backwards(). The rest of the patches are
> related to adding support for an alternative way to deal with
> marginal
> paths. Instead of delaying their reinstatement, which can cause
> problems
> if multipath isn't set to queue IO when there are no usable paths,
> this
> patchset adds a marginal_pathgroups option. If this is set, marginal
> paths will be reinstated, but added to seperate marginal pathgroups.
> They will remain there until the time when they would normally be
> reinstated, at which point they will be returned to their regular
> pathgroups. Marginal pathgroups will have a priority lower than all
> regular pathgroups. This has the advantage of continuing to track
> marginal paths, even if all the other paths go down temporarily, so
> that
> multipath can switch back to the normal paths as soon as they come
> back
> up.  This code also allows users to manually move paths between
> marginal
> and regular pathgroups. This is especially important for Broadcom's
> Fiber Channel Transport Daemon, since it doesn't use the multipathd
> marginal path detectors, and thus will not automatically reinstate
> marginal paths when all other paths have failed.
> 
> https://www.mail-archive.com/dm-devel@redhat.com/msg12956.html
> 
> Changes in v2:
> - patch 04/14 is a combination of the old 04/16, 06/16, and 07/16
>   patches, based on Martin's suggestion. Since all the code is the
> same
>   as the previous patches, I have kept Martin's Reviewed-by
> 
> - old patch 09/16 has been moved up to 05/14 based on Martin's
>   suggestion. There are no code changes
> 
> - patch 09/14 (old patch 11/16) moves path_group_prio_update()
>   earlier in select_path_group() to make sure the pgp->marginal check
>   uses a current value.
> 
> - patch 12/14 (old patch 14/16) changes how delay_checks is selected,
>   to ignore the delay_checks values if any san_path_err options are
>   set, based on Martin's suggestions. It also changes the man page
>   wording.
> 
> Benjamin Marzinski (14):
>   libmultipath: make vector_foreach_slot_backwards work as expected
>   libmultipath: add marginal paths and groups infrastructure
>   tests: add path grouping policy unit tests.
>   libmultipath: add wrapper function around pgpolicyfn
>   tests: update pgpolicy tests to work with group_paths()
>   libmultipath: fix double free in pgpolicyfn error paths
>   libmultipath: consolidate group_by_* functions
>   libmultipath: make pgpolicyfn take a paths vector
>   libmultipath: make group_paths handle marginal paths
>   tests: add tests for grouping marginal paths.
>   libmultipath: add marginal_pathgroups config option
>   libmutipath: deprecate delay_*_checks
>   multipathd: use marginal_pathgroups
>   multipath: update man pages
> 
>  libmultipath/config.h      |    1 +
>  libmultipath/configure.c   |   23 +-
>  libmultipath/dict.c        |    3 +
>  libmultipath/pgpolicies.c  |  346 +++++-------
>  libmultipath/pgpolicies.h  |   12 +-
>  libmultipath/print.c       |   18 +
>  libmultipath/print.h       |    6 +-
>  libmultipath/propsel.c     |   89 +++-
>  libmultipath/propsel.h     |    3 +-
>  libmultipath/structs.c     |   16 +-
>  libmultipath/structs.h     |   15 +-
>  libmultipath/switchgroup.c |   15 +-
>  libmultipath/vector.h      |    2 +-
>  multipath/multipath.conf.5 |   74 ++-
>  multipathd/cli.c           |    5 +
>  multipathd/cli.h           |    4 +
>  multipathd/cli_handlers.c  |   91 ++++
>  multipathd/cli_handlers.h  |    3 +
>  multipathd/main.c          |   90 ++--
>  multipathd/multipathd.8    |   19 +
>  tests/Makefile             |    2 +-
>  tests/pgpolicy.c           | 1036
> ++++++++++++++++++++++++++++++++++++
>  22 files changed, 1523 insertions(+), 350 deletions(-)
>  create mode 100644 tests/pgpolicy.c
> 


For the entire set:

Reviewed-by: Martin Wilck <mwilck@suse.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
