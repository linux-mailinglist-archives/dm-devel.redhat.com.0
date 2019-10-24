Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 83229E3772
	for <lists+dm-devel@lfdr.de>; Thu, 24 Oct 2019 18:09:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571933346;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FItOImzUGWDdudcXdhIoCc7ZHYEbnLp7ESmjvMHcj/k=;
	b=OQf2pTqZSA5fo51ErkuqjmlK6Bf6SfRK0oXu89quBmJZ27xOtmnGhQX1kPKx/u1NdguPx0
	cTMdZlH1ARLm3xDs1PLuStx5n9pz4WtimWo3CuBV3OB0cggrDJfm8E0GHZe0jfedPk8azd
	owswpYKr1w1AnHLQYVRWThbOPuBkYYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-FvEh9C7kOXSf89lLjBz9FA-1; Thu, 24 Oct 2019 11:46:24 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E4231005595;
	Thu, 24 Oct 2019 15:17:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AF4060BE0;
	Thu, 24 Oct 2019 15:17:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 22B4C4EE68;
	Thu, 24 Oct 2019 15:16:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9OFFjPb000472 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 11:15:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4ED225D713; Thu, 24 Oct 2019 15:15:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9A3C5D712;
	Thu, 24 Oct 2019 15:15:42 +0000 (UTC)
Received: from m9a0001g.houston.softwaregrp.com
	(m9a0001g.houston.softwaregrp.com [15.124.64.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D830308FBFC;
	Thu, 24 Oct 2019 15:15:30 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0001g.houston.softwaregrp.com WITH ESMTP; 
	Thu, 24 Oct 2019 15:14:53 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Thu, 24 Oct 2019 15:06:11 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.72.13) by
	M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Thu, 24 Oct 2019 15:06:11 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3239.namprd18.prod.outlook.com (52.132.244.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2367.24; Thu, 24 Oct 2019 15:06:09 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2347.030;
	Thu, 24 Oct 2019 15:06:09 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Bart Van Assche <Bart.VanAssche@sandisk.com>
Thread-Topic: [PATCH v2 00/72]  multipath-tools: cleanup and warning enablement
Thread-Index: AQHVinyQ5PmGM7pZGUuFhk9rAK8yYw==
Date: Thu, 24 Oct 2019 15:06:08 +0000
Message-ID: <20191024150556.19575-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0042.eurprd05.prod.outlook.com
	(2603:10a6:208:be::19) To CH2PR18MB3349.namprd18.prod.outlook.com
	(2603:10b6:610:28::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [90.186.0.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: facdeb92-1867-45c3-6d57-08d75893b316
x-ms-traffictypediagnostic: CH2PR18MB3239:
x-ms-exchange-purlcount: 3
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR18MB32390DB09DA3C5D4F6A17D09FC6A0@CH2PR18MB3239.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(189003)(199004)(14454004)(110136005)(316002)(54906003)(66066001)(99286004)(2616005)(486006)(476003)(71200400001)(71190400001)(14444005)(256004)(1076003)(30864003)(44832011)(66446008)(64756008)(66556008)(66476007)(66946007)(3846002)(6116002)(7736002)(305945005)(2906002)(5660300002)(81166006)(81156014)(6436002)(86362001)(36756003)(6486002)(1691005)(6512007)(102836004)(107886003)(6306002)(966005)(4326008)(478600001)(186003)(8676002)(6506007)(386003)(25786009)(50226002)(52116002)(8936002)(26005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3239;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a9q9JPavEfYTMNV3l4ZJ98B7tenyVdxIaRLjZSK+NA4dRss6Eh9kEEOJO2bG2KIyr/0Myx5fPJAe5Hnf7U9nc2iBbyMIl003/nhHoeQ7rORd2Pc/dBUJq+2oDDu4FbzG6+69hzNLS0uGKYF2iC87BkI+xSFgRXFfD08Rso11/6aqi0HsMe7tjxsOSOZen7mxsBfefLGecEH+iGCwHRgH1i6W0rLQKAASWkUpHTE5uYFNRcyUzwcsLw2zmpNJpCBAbl5SjvLu9BuxJbkqoUuk6/j8riADWzd0wpGqr48YMsuLWsR5lmd5ZygdawEAERChWQU1pEfRUZC7HSoEVclaJfX5G1lsTsVGwOlWN+wZ9gBXDZO5UbljvN+X7eH/0ZRUlQRUmoHthe9KRh75x/inuCH2UW5NXey8EkRp0CAQZ7vZFRfUZuS21W3NrMz08LkNqxwhJ3Gzk2VMnmiPTRhvV2TaZw3j4lRGxkkxKcbcoso=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: facdeb92-1867-45c3-6d57-08d75893b316
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 15:06:08.7960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MHAhd1qq7dNW1xWMzR3sGw7XtYqPDYyWNNfstRcUByDMmAm0kIuJkIrtO2vR043tRlEBdXHs8liQ6ExTns+tHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3239
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Thu, 24 Oct 2019 15:15:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Thu, 24 Oct 2019 15:15:41 +0000 (UTC) for IP:'15.124.64.66'
	DOMAIN:'m9a0001g.houston.softwaregrp.com'
	HELO:'m9a0001g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.66
	m9a0001g.houston.softwaregrp.com 15.124.64.66
	m9a0001g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9OFFjPb000472
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 00/72] multipath-tools: cleanup and warning
	enablement
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
X-MC-Unique: FvEh9C7kOXSf89lLjBz9FA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Martin Wilck <mwilck@suse.com>

Hi Christophe, hi Ben, hi Bart,

here is a series with cleanup patches and minor fixes for multipath-tools.
Sorry about the number of patches, I hope this way the series will be easie=
r
to review. There are lots of obvious, short hunks. In terms of LoC, most
of the changes are in a new unit test, in the NVMe code update, and in
a (necessary) indentation change in the VPD code.

Patch 01-14 are part of a recent effort to go over the multipath-tools
code, re-review, and modernize the code a bit. Part of that is adding "cons=
t"
qualifiers to function arguments, as I did before. I happened to start with
"alias.c", for alphabetic reasons. Other parts of the code will hopefully
follow.

15-20 are misc fixes for stuff I came across while working on the
"-Wclobbered" flag (see below).

The rest of the series is an attempt to get rid of the disablement of
warnings that we had so far in multipath-tools. I believe we agree that
warning-free code is a good thing and that disabling warnings should be
avoided if possible. My goal was to be able to set "-Werror" and compile
successfully with all currently relevant compilers.

Patch 21-42 fix issues with -Wunused-parameter and finally enable that
warning. -Wno-unused-parameter is only kept in place for
libmultipath/dict.c and multipathd/cli-handlers.c, which basically consist
only of implementations of certain prototypes where many functions don't
use every argument, and hundreds of "unused" attributes would pollute the
code too much. Patch 53-58 fix issues with "-Wsign-compare". This was
actually a good excercise, because I was forced to think twice which
signedness was correct for certain variables and expressions. Patch 59-64
fix some warnings that are issued by clang with our current warning setting=
s
(in particular, -Wformat-literal).

Patch 65 is an update of our nvme code from nvme-cli 1.9. Patch 66-71
contain some make file fixes and cleanups, and adaptations for older
compilers. Finally, Patch 71 enables -Werror, and patch 72 tests for
"-Wno-clobbered", which clang doesn't support.

I can proudly say that multipath-tools now compiles without warnings or
errors with -Werror and with a large set of compilers. I tested gcc 4.8,
7, 8, 9 and clang 3.9, 6, 7, and 8.

The only "-Wno" option that now remains is "-Wclobbered". I have put
considerable work into trying to eliminate that as well. The result
can be examined in the "Wclobbered" branch of my github fork:
https://github.com/mwilck/multipath-tools/commits/Wclobbered
(yes, that's another 37 patches on top of this already long series).

I have pondered this back and forth whether to submit that part of the
series, too. All the -Wclobbered warnings are caused by pthread_cleanup_pus=
h()
calls, of which our code has a lot, and which glibc implements using a
sigsetjmp() call. These warnings are arguably a false positives, and
a bug of either gcc, glibc, or both
(see e.g. https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D61118).=20

Eliminating these warnings is possible, but it requires a lot of changes
in the code. Some of them are actually beneficial for readability, but
others are rather not. Some are outright mysterious (e.g.
https://github.com/mwilck/multipath-tools/commit/bb53d666777f072e60372979ee=
d51752db03cec4),
and finding the workarounds was trial-and error work. Also, there are
variations between gcc versions.

The bottom line is, while I feel sorry about the vain effort=20
I put into this, my personal opinion is that silencing just this single
warning isn't worth that big amount of changes.

Reviews and opinions welcome.

Regards
Martin

Changes in v2:
  45/72: The way I handled snprintf() was wrong. Fix it, and use
         safe_sn?printf() to hide cast ugliness (Bart van Assche)

  All other patches remain unchanged, not resending them.

Martin Wilck (72):
  multipath tests: move condlog test wrappers to separate file
  multipath tests: add tests for alias handling
  libmultipath: alias.c: constify function arguments
  libmultipath: alias.c: use strlcpy(), and 2 minor fixes
  libmultipath: format_devname: avoid buffer overflow
  libmultipath: scan_devname: fix int overflow detection
  libmultipath: lookup_binding(): don't rely on int overflow
  libmultipath: rlookup_binding(): removed unused parameter
  libmultipath: allocate_binding(): error out for id=3D0
  libmultipath: allocate_binding(): detect line overflow
  multipath tests: alias: add tests for allocate_binding()
  multipath tests: alias: add format/scan test
  libmultipath: alias.c: prepare for cancel-safe allocation
  multipath tests: use -lpthread for alias test
  libmultipath: path_discovery: handle libudev errors
  libmultipath: make path_discovery() pthread_cancel()-safe
  libmultipath: uevent_listen(): fix poll() retval check
  libmultipath: replace_wwids(): fix possible fd leak
  libmultipath: remove_wwids(): fix possible leaks
  libmultipath: _init_foreign(): fix possible memory leak
  libmultipath: process_config_dir(): remove unused argument
  libmultipath: mark unused arguments in partmap functions
  libmultipath: scsi_ioctl_pathinfo(): remove unused argument
  multipath-tools: mark unused params in signal and cleanup handlers
  libmultipath: get_ana_info(): remove unused parameter
  libmultipath: mark unused params in getprio() methods
  libmultipath: hp_sw: remove usused argument in do_inq()
  libmultipath: checkers: mark unused arguments in methods
  multipathd: stop_waiter_thread(): removed unused parameter
  multipath tools: mark unused arguments in thread routines
  kpartx: gpt: remove unused arg in read_lastoddsector()
  kpartx: mark unused arguments in ptreader methods
  libmultipath: mark missing arguments in functions matching prototypes
  libmultipath: get_pgpolicy_name(): use "len" parameter
  libmultipath: snprint_multipath_map_json(): remove unused argument
  multipath: delegate_to_multipathd: mark unused arguments
  libmultipath: use -Wno-unused-parameter for dict.c
  multipathd: use -Wno-unused-parameter for cli_handlers.c
  libmpathpersist: remove unused "noisy" argument in various functions
  libmpathpersist: fix copy-paste error in mpath_format_readresv()
  multipath-tools tests: add -Wno-unused-parameter
  multipath-tools: Makefile.inc: remove -Wno-unused-parameter
  libmultipath: dev_loss_tmo is unsigned
  libmultipath: trivial changes for -Wsign-compare
  libmultipath: fix -Wsign-compare warnings with snprintf()
  libmultipath: parse_vpd_pg83(): sanitize indentation
  libmultipath: parse_vpd_pg83(): fix -Wsign-compare warnings
  libmultipath: print: use unsigned int for "width" field
  libmultipath: vector_for_each_slot: fix -Wsign-compare warnings
  libmultipath: set_int(): add error check and set_uint()
  libmultipath: make "checkint" unsigned
  libmultipath: use unsigned blksize in directio context
  libmultipath, kpartx: byteorder: always use unsigned types
  libmpathcmd: fix -Wsign-compare warnings
  libmpathpersist: fix -Wsign-compare warnings
  kpartx: use unsigned arguments in dm_devn() and dm_prereq()
  kpartx: use unsigned int for "ns" argument of ptreader
  multipath-tools: Makefile.inc: enable -Wsign-compare
  libdmmp: fix clang -Wformat-nonliteral warnings
  libmultipath: fix clang -Wformat-literal warnings
  multipath tests: blacklist: remove always-true condition
  multipath tests: hwtable: fix strncat() invocation
  multipath tests: fix -Wformat-literal warning
  multipath tests: util: fix clang strlcpy warnings
  libmultipath: nvme: update to nvme-cli v1.9
  multipath-tools: Makefile.inc: fix TEST_CC_OPTION
  multipath-tools: Makefile.inc: use -Wp,... for compiling only
  multipath-tools: Makefile: use proper directory recursion
  multipath tests: Makefile: fix "clean" target
  multipath tests: Makefile: avoid gcc 4.8 missing initializers failure
  multipath-tools: Makefile.inc: enable -Werror
  multipath-tools: Makefile.inc: test for -Wno-clobbered support

 Makefile                                 |  38 +-
 Makefile.inc                             |  15 +-
 kpartx/bsd.c                             |   4 +-
 kpartx/dasd.c                            |   3 +-
 kpartx/devmapper.c                       |  13 +-
 kpartx/devmapper.h                       |   7 +-
 kpartx/dos.c                             |   4 +-
 kpartx/gpt.c                             |  15 +-
 kpartx/gpt.h                             |   2 +-
 kpartx/kpartx.h                          |  20 +-
 kpartx/mac.c                             |   5 +-
 kpartx/ps3.c                             |   5 +-
 kpartx/solaris.c                         |   4 +-
 kpartx/sun.c                             |   4 +-
 kpartx/unixware.c                        |   4 +-
 libdmmp/libdmmp_private.h                |   8 +-
 libmpathcmd/mpath_cmd.c                  |   5 +-
 libmpathpersist/mpath_persist.c          |   3 +-
 libmpathpersist/mpath_pr_ioctl.c         |  40 +-
 libmultipath/Makefile                    |   5 +
 libmultipath/alias.c                     | 134 ++--
 libmultipath/alias.h                     |  12 +-
 libmultipath/byteorder.h                 |  12 +-
 libmultipath/checkers/cciss_tur.c        |   4 +-
 libmultipath/checkers/directio.c         |   2 +-
 libmultipath/checkers/hp_sw.c            |   8 +-
 libmultipath/checkers/rdac.c             |   2 +-
 libmultipath/checkers/readsector0.c      |   4 +-
 libmultipath/config.c                    |   4 +-
 libmultipath/config.h                    |   4 +-
 libmultipath/defaults.h                  |   4 +-
 libmultipath/devmapper.c                 |  10 +-
 libmultipath/dict.c                      |  52 +-
 libmultipath/discovery.c                 | 284 +++++----
 libmultipath/discovery.h                 |   2 +-
 libmultipath/dm-generic.c                |   6 +-
 libmultipath/file.c                      |   5 +-
 libmultipath/foreign.c                   |  20 +-
 libmultipath/foreign/nvme.c              |  26 +-
 libmultipath/generic.c                   |   2 +-
 libmultipath/io_err_stat.c               |  10 +-
 libmultipath/log.h                       |   3 +-
 libmultipath/log_pthread.c               |   2 +-
 libmultipath/log_pthread.h               |   3 +-
 libmultipath/nvme/linux/nvme.h           | 136 ++++-
 libmultipath/nvme/nvme-ioctl.c           | 229 ++++---
 libmultipath/nvme/nvme-ioctl.h           |  31 +-
 libmultipath/nvme/nvme.h                 | 121 +++-
 libmultipath/parser.c                    |   2 +-
 libmultipath/pgpolicies.c                |   2 +-
 libmultipath/print.c                     |  14 +-
 libmultipath/print.h                     |   8 +-
 libmultipath/prioritizers/alua_rtpg.c    |   2 +-
 libmultipath/prioritizers/ana.c          |  14 +-
 libmultipath/prioritizers/const.c        |   4 +-
 libmultipath/prioritizers/datacore.c     |   3 +-
 libmultipath/prioritizers/emc.c          |   3 +-
 libmultipath/prioritizers/hds.c          |   3 +-
 libmultipath/prioritizers/hp_sw.c        |   3 +-
 libmultipath/prioritizers/iet.c          |   3 +-
 libmultipath/prioritizers/ontap.c        |   3 +-
 libmultipath/prioritizers/random.c       |   4 +-
 libmultipath/prioritizers/rdac.c         |   3 +-
 libmultipath/prioritizers/sysfs.c        |   3 +-
 libmultipath/prioritizers/weightedpath.c |   3 +-
 libmultipath/structs.c                   |   4 +-
 libmultipath/structs.h                   |   3 +-
 libmultipath/structs_vec.c               |   2 +-
 libmultipath/sysfs.c                     |  13 +-
 libmultipath/time-util.c                 |   6 +-
 libmultipath/uevent.c                    |   5 +-
 libmultipath/util.c                      |   7 +-
 libmultipath/util.h                      |  15 +-
 libmultipath/uxsock.c                    |   3 +-
 libmultipath/vector.h                    |   4 +-
 libmultipath/wwids.c                     |  40 +-
 mpathpersist/main.c                      |   2 +-
 multipath/main.c                         |  11 +-
 multipathd/Makefile                      |   3 +
 multipathd/cli_handlers.c                |   2 +-
 multipathd/dmevents.c                    |   4 +-
 multipathd/main.c                        |  36 +-
 multipathd/pidfile.c                     |   2 +-
 multipathd/waiter.c                      |   2 +-
 multipathd/waiter.h                      |   2 +-
 tests/Makefile                           |  19 +-
 tests/alias.c                            | 744 +++++++++++++++++++++++
 tests/blacklist.c                        |  22 +-
 tests/hwtable.c                          |   2 +-
 tests/test-log.c                         |  27 +
 tests/test-log.h                         |   7 +
 tests/util.c                             |  16 +-
 92 files changed, 1818 insertions(+), 598 deletions(-)
 create mode 100644 tests/alias.c
 create mode 100644 tests/test-log.c
 create mode 100644 tests/test-log.h

--=20
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

