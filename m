Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 21A90F2AC3
	for <lists+dm-devel@lfdr.de>; Thu,  7 Nov 2019 10:33:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573119235;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xO7ZajIVRq11TrCzpCUCpfl29T8Y4oe0oMGCXz3Juu4=;
	b=C0m1Xnrtie+CQmZ5X0exgJw4YN+mJjcXqnwDHQvcfqy0ooEvJo4ZQ+s/61hal3TJ6ufSBn
	o5ReQZ0BPMRLAPuco+AMJM2SnJUhEEjXBOowRS09BtpAxdOkp+LpdBic9n/VPcn4sL8q9O
	JKNPpXo+c7CdPlPBETdxG/JIPhME4bk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-7OQ4JYzHO7Cdhq59qImxkg-1; Thu, 07 Nov 2019 04:33:52 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD0E9801FBF;
	Thu,  7 Nov 2019 09:33:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 439C110013A1;
	Thu,  7 Nov 2019 09:33:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 14B6818089C8;
	Thu,  7 Nov 2019 09:33:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA79XbDI013574 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 04:33:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 92F175D713; Thu,  7 Nov 2019 09:33:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx26.extmail.prod.ext.phx2.redhat.com
	[10.5.110.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1996E5D70E;
	Thu,  7 Nov 2019 09:33:35 +0000 (UTC)
Received: from m4a0039g.houston.softwaregrp.com
	(m4a0039g.houston.softwaregrp.com [15.124.2.85])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6964089B0E8;
	Thu,  7 Nov 2019 09:33:32 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0039g.houston.softwaregrp.com WITH ESMTP; 
	Thu,  7 Nov 2019 09:32:24 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Thu, 7 Nov 2019 09:27:40 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.14) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Thu, 7 Nov 2019 09:27:40 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (10.175.223.16) by
	DM5PR18MB1243.namprd18.prod.outlook.com (10.173.210.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Thu, 7 Nov 2019 09:27:39 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1db:c70a:b831:8150]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1db:c70a:b831:8150%5]) with mapi id 15.20.2408.024;
	Thu, 7 Nov 2019 09:27:38 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Bart Van Assche
	<Bart.VanAssche@sandisk.com>, Benjamin Marzinski <bmarzins@redhat.com>
Thread-Topic: [PATCH v3 00/72] multipath-tools: cleanup and warning enablement
Thread-Index: AQHVlU2Whz00ZL9pIkCKS69dMPJzFg==
Date: Thu, 7 Nov 2019 09:27:34 +0000
Message-ID: <20191107092651.10975-1-martin.wilck@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0027.eurprd01.prod.exchangelabs.com
	(2603:10a6:208:69::40) To DM5PR18MB1355.namprd18.prod.outlook.com
	(2603:10b6:3:14a::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2.206.153.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 079d07ac-b217-4bac-88ce-08d76364b8cf
x-ms-traffictypediagnostic: DM5PR18MB1243:
x-ms-exchange-purlcount: 3
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR18MB124352A98BCB71532D453EEDFC780@DM5PR18MB1243.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(199004)(189003)(8676002)(66556008)(81156014)(486006)(44832011)(81166006)(2616005)(6506007)(386003)(8936002)(6666004)(478600001)(966005)(476003)(64756008)(186003)(66946007)(66476007)(71190400001)(6486002)(6512007)(6306002)(6436002)(66446008)(52116002)(102836004)(1691005)(36756003)(25786009)(7736002)(305945005)(14454004)(4326008)(30864003)(256004)(14444005)(110136005)(1076003)(2906002)(86362001)(5660300002)(71200400001)(316002)(50226002)(26005)(99286004)(6116002)(3846002)(66066001)(54906003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB1243;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nZwXo9Qv8avaSe3s3sCzzFa31fBd+qc1VA60k/zL2ZgXnxW4Btl1Zx7k+H0MRUywciiEsvOhfz65R84fMK0QjU6AiW9w2MLtHuzsT06ugc5pR0/MZBKCtPYJAjQbjFlTM7cUOIF6lB06baZnPpkZZkLrjnkaBf0wnyt+DkYwL/9IgJrrwIIiWc5K1kBGEL7KQNnNo9KYxi2oy8CAhv0Ifn65yl32VowB2PHMwUaSF3GsGh9KGbiu5gQp7d8xobRitYxfBJq2JMyVfJEqmUd1+ZKleZ1WQYS0j+T762Ra0By8yMyrvfO36vmwsW+4XKlcq1FKIOOJlUnm4JllEdZCxMn/ERnjBBA9LsbyhzIEooyFwttBy1PS4DKLFfNuWVv25GOBe/ucTma9o0pmy/4C+Luxfy1J0Ffxbglhp1UlaqCfQyRfDw0IugatZiBobO/jb2B7I9wl+bRM0beti3sfqEQmVAgJ6524ZiBvRJPqXcI=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 079d07ac-b217-4bac-88ce-08d76364b8cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 09:27:35.9735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f43jq9uhogKenTZK8rfQI1TaVmJ6JhNFfAO03n2/VoQh2sruZ7O/tmED5NT++yuCNtBbYF5xEPA0ZHkvSL4egA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1243
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.67]); Thu, 07 Nov 2019 09:33:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]);
	Thu, 07 Nov 2019 09:33:33 +0000 (UTC) for IP:'15.124.2.85'
	DOMAIN:'m4a0039g.houston.softwaregrp.com'
	HELO:'m4a0039g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.85
	m4a0039g.houston.softwaregrp.com 15.124.2.85
	m4a0039g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.67
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xA79XbDI013574
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 00/72] multipath-tools: cleanup and warning
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 7OQ4JYzHO7Cdhq59qImxkg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Martin Wilck <mwilck@suse.com>

Hi Christophe, hi Ben, hi Bart,

(I found a glitch in the v2 submission of this series. Details below).

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

Changes v1 -> v2:
  45/72: The way I handled snprintf() was wrong. Fix it, and use
         safe_sn?printf() to hide cast ugliness (Bart van Assche)
Changes v2 -> v3:
  45/72: safe_snprintf(): Replaced wrong references to macro argument
  =09 "size" with variable "__size".

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

