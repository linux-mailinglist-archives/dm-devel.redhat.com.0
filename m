Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id AD79D2428BA
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:33:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-rXCriWtNPQqPLMmWLgOsfw-1; Wed, 12 Aug 2020 07:33:29 -0400
X-MC-Unique: rXCriWtNPQqPLMmWLgOsfw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AABF3107ACCA;
	Wed, 12 Aug 2020 11:33:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB48319C4F;
	Wed, 12 Aug 2020 11:33:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB106181A06D;
	Wed, 12 Aug 2020 11:33:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBX8mu028422 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:33:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 40C772026D5D; Wed, 12 Aug 2020 11:33:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CAE32026D69
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:33:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88D86101A525
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:33:05 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-310-YeSAc4t6OlSjeRbLMCVkWw-1;
	Wed, 12 Aug 2020 07:33:01 -0400
X-MC-Unique: YeSAc4t6OlSjeRbLMCVkWw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 435A0AE0A;
	Wed, 12 Aug 2020 11:33:21 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:32:30 +0200
Message-Id: <20200812113232.25962-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBX8mu028422
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 00/39] multipath-tools series part I: minor
	changes
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe, hi Ben,

This is part I of a larger patch series for multpath-tools I've been preparing.
It contains self-contained fixes and cleanups, and unit test additions.

This is v2 of the series I posted on 2020-07-09. To avoid spamming, I will
resend only the patches that have changed (including context changes).
I took care to make sure the numbering is preserved. The full series will
be available here:
https://github.com/mwilck/multipath-tools/tree/ups/submit-2008

There are tags in that repo for each part of the series.
This part is tagged "submit-200812-1".

It's based on 0.8.4, plus the following set of previously
submitted and reviewed patches (latest first):

 - [PATCH v2 0/8] multipath cleanups (v2 8-part series from Ben,
       without 7/8 "multipathd: unset mpp->hwe when removing map")
 - [PATCH v3] vector: return false if realloc fails in vector_alloc_slot func (Zhiqiang Liu)
 - libmultipath: free pgp if add_pathgroup fails in disassemble_map func (Zhiqiang Liu)
 - checker: add input check of state in checker_state_name func (Zhiqiang Liu)
 - libmultipath: fix null dereference in add (lixiaokeng)
 - tests/hwtable: fix a memory free in replicate_config (Zhiqiang Liu)
 - vector: fix upper boundary check of vector size in vector_del_slot (Zhiqiang Liu)
 - vector: add lower bound check of E in VECTOR_SLOT (Zhiqiang Liu)
 - devmapper: remove useless using of memset in dm_get_info func (Zhiqiang Liu)
 - libmultipath: fix a memory leak in dm_get_maps (lixiaokeng)
 - libmultipath: fix a memory leak in disassemble_status func (Zhiqiang Liu)
 - [PATCH 0/4] Fix segfault on access to mpp->hwe (4-part series, me)

(below is where the v1 series was based on)

 - libmultipath: add device to hwtable.c (Steve Schremmer)
 - [PATCH v3 0/7] Fix muitpath/multipathd flush issue (v3 7-part series, Ben)
 - [PATCH v2 0/4] misc patches (v2 4-part series, Ben)
 - multipath: Fix compiler warnings when built without systemd. (Marius Bakke)
 - [PATCH v2 0/3] multipath: change default devnode blacklist
   (v2 3-part series, Ben)
 - multipath: add "-e" option to enable foreign libraries (me)
 - libmultipath: set "enable_foreign" to NONE by default (me)
 - libmultipath: fix condlog NULL argument in uevent_get_env_var (Ben)
 - fix boolean value with json-c 0.14 (Christian Hesse) 
 - [PATCH v3 0/6] multipath: path validation library prep work
   (v3 6-part series, me)
 - [PATCH 0/2] More minor libmultipath fixes (2-part series, me)
 - [PATCH 00/11] Minor fixes for multipath-tools (11-part series, me)
 - libmpathpersist: depend on libmultipath (Christian Hesse)
 - [PATCH v2 0/2] multipath-tools: fixes for kpartx.rules and skip_kpartx
   (v2 2-part series, me)
 - libmultipath: allow force reload with no active paths (Ben)
 - libmutipath: don't close fd on dm_lib_release (Ben)-
 - libmultipath: assign variable to make gcc happy (Ben)
 - [PATCH v2 0/4] libmpathpersist allocation size fixes (v2 4-part series, me)

You can find a full tree of the code this is based on here:
https://github.com/openSUSE/multipath-tools/tree/upstream-queue

Regards, Martin

Changes v1 -> v2, as suggested by Ben Marzinski:

 *  8/35 "libmultipath: create bitfield abstraction"
    - return NULL for 0 bitfield size
    - fixed error handling for bf == NULL
    - removed unused find_first_set() and related tests
 * 12/35 "libmultipath: strlcpy()/strlcat(): use restrict qualifier"
    - unchanged, but resubmitting as it has no Reviewed-by: tag yet
      (corner case of unterminated "dst" still unresolved, but if at
       all, it should be changed in a separate patch).

Martin Wilck (35):
  multipath-tools tests/util: separate group for bitmask tests
  multipath-tools tests/directio: fix missing initializers
  tests: __wrap_dlog: use check_expected()
  multipath tools tests: add strchop() test
  libmultipath: improve strchop()
  multipath-tools tests: add test for devt2devname
  libmultipath: devt2devname(): simplify using libudev
  libmultipath: create bitfield abstraction
  libmultipath: use bitfields in group_by_match()
  libmultipath: util: constify function arguments
  multipath-tools tests: add unit tests for strlcat
  libmultipath: strlcpy()/strlcat(): use restrict qualifier
  libmultipath: constify blacklist code
  libmultipath: rlookup_binding(): remove newline in log message
  libmultipath: fix missing initializer warning from clang 3.9
  libmultipath: fix gcc -Wstringop-overflow warning
  libmultipath: remove uevent listener failback
  libmultipath: uevent: use static linkage where possible
  libmultipath: uevent: inline trivial functions
  libmultipath: decrease log level of "SCSI target" log message
  libmultipath: get_udev_uid(): more appropriate error code
  libmultipath: get_uid(): improve log message on udev failure
  libmultipath: make sysfs_pathinfo() static and use const
  libmultipath: pathinfo(): improve a log message
  libmultipath: pathinfo(): don't filter emtpy devnode names
  libmultipath: io_err_stat_handle_pathfail(): less error conditions
  libmultipath: improve libdm logging
  libmultipath: snprint_devices(): use udev_enumerate
  libmultipath: snprint_devices(): print hidden/foreign status
  libmultipath: alloc_path(): initialize pp->initialized
  libmultipath: alloc_path_with_pathinfo(): treat devname overflow as
    error
  libmultipath: log table params in addmap()
  multipathd: remove set_multipath_wwid()
  kpartx: print an error message if removing a partition fails
  kpartx: add missing newline

 kpartx/devmapper.c               |   2 +-
 kpartx/kpartx.c                  |   2 +
 libmultipath/alias.c             |   2 +-
 libmultipath/blacklist.c         |  34 +-
 libmultipath/blacklist.h         |  17 +-
 libmultipath/checkers/directio.c |   2 +-
 libmultipath/configure.c         |  11 +-
 libmultipath/defaults.h          |   2 +
 libmultipath/devmapper.c         |  27 +-
 libmultipath/discovery.c         |  30 +-
 libmultipath/dmparser.c          |   2 +-
 libmultipath/io_err_stat.c       |  25 +-
 libmultipath/parser.c            |   2 +-
 libmultipath/pgpolicies.c        |  12 +-
 libmultipath/print.c             |  90 ++---
 libmultipath/print.h             |   2 +-
 libmultipath/propsel.c           |   6 +
 libmultipath/structs.c           |   1 +
 libmultipath/uevent.c            | 324 ++---------------
 libmultipath/uevent.h            |  47 ++-
 libmultipath/util.c              | 168 ++++-----
 libmultipath/util.h              |  73 +++-
 multipathd/main.c                |  14 +-
 tests/Makefile                   |   3 +-
 tests/alias.c                    |   4 +-
 tests/devt.c                     | 192 ++++++++++
 tests/directio.c                 |  28 +-
 tests/test-log.c                 |   5 +-
 tests/uevent.c                   |   4 -
 tests/util.c                     | 586 ++++++++++++++++++++++++++++---
 30 files changed, 1081 insertions(+), 636 deletions(-)
 create mode 100644 tests/devt.c

-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

