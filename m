Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 202D022702D
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 23:11:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595279489;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LIUNBhrct1igsP6rdFoG1+FxtWCGtGHebaXnoZux1o0=;
	b=aXYXud/11sPwP7d75xvCk/6nwISKA2JfRdiNHx/IiuWyH9nuVFHfsuFys4e7GLFLJo2zcC
	BLfGHUJ7vIohGnslvZmfrJX9eAmK+Rm3dqGXt5ztC6jcDgLOhNUdXKVd37TVHE6ZZzDOHx
	qasytVE9DoIey7z2ZUJGUgdd66xdiZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-TwgVk2rnPC6f04eslzsBpA-1; Mon, 20 Jul 2020 17:11:26 -0400
X-MC-Unique: TwgVk2rnPC6f04eslzsBpA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 758AB58;
	Mon, 20 Jul 2020 21:11:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92F211059583;
	Mon, 20 Jul 2020 21:11:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BCC81809554;
	Mon, 20 Jul 2020 21:11:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06KL9vw8016050 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 17:09:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 467AC4DA91; Mon, 20 Jul 2020 21:09:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D86545C22A;
	Mon, 20 Jul 2020 21:09:53 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06KL9qmU018849; 
	Mon, 20 Jul 2020 16:09:52 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06KL9p9l018848;
	Mon, 20 Jul 2020 16:09:51 -0500
Date: Mon, 20 Jul 2020 16:09:51 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200720210951.GD11089@octiron.msp.redhat.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 00/35] multipath-tools series part I: minor
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 09, 2020 at 12:15:45PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hi Christophe, hi Ben,
> 
> This is part I of a larger patch series for multpath-tools I've been preparing.
> It contains self-contained fixes and cleanups, and unit test additions.
> 
> The full series will also be available here:
> https://github.com/mwilck/multipath-tools/tree/ups/submit-2007
> 
> There are tags in that repo for each part of the series.
> This part is tagged "submit-200709-1".

For the part, with the exception of patches 8 & 12
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
 
> It's based on 0.8.4, plus the following set of previously
> submitted and reviewed patches:
> 
>  - libmultipath: add device to hwtable.c (Steve Schremmer)
>  - [PATCH v3 0/7] Fix muitpath/multipathd flush issue (v3 7-part series, Ben)
>  - [PATCH v2 0/4] misc patches (v2 4-part series, Ben)
>  - multipath: Fix compiler warnings when built without systemd. (Marius Bakke)
>  - [PATCH v2 0/3] multipath: change default devnode blacklist
>    (v2 3-part series, Ben)
>  - multipath: add "-e" option to enable foreign libraries (me)
>  - libmultipath: set "enable_foreign" to NONE by default (me)
>  - libmultipath: fix condlog NULL argument in uevent_get_env_var (Ben)
>  - fix boolean value with json-c 0.14 (Christian Hesse) 
>  - [PATCH v3 0/6] multipath: path validation library prep work
>    (v3 6-part series, me)
>  - [PATCH 0/2] More minor libmultipath fixes (2-part series, me)
>  - [PATCH 00/11] Minor fixes for multipath-tools (11-part series, me)
>  - libmpathpersist: depend on libmultipath (Christian Hesse)
>  - [PATCH v2 0/2] multipath-tools: fixes for kpartx.rules and skip_kpartx
>    (v2 2-part series, me)
>  - libmultipath: allow force reload with no active paths (Ben)
>  - libmutipath: don't close fd on dm_lib_release (Ben)
>  - libmultipath: assign variable to make gcc happy (Ben)
>  - [PATCH v2 0/4] libmpathpersist allocation size fixes (v2 4-part series, me)
> 
> You can find a full tree of the code this is based on here:
> https://github.com/openSUSE/multipath-tools/tree/upstream-queue
> 
> Regards, Martin
> 
> 
> Martin Wilck (35):
>   multipath-tools tests/util: separate group for bitmask tests
>   multipath-tools tests/directio: fix missing initializers
>   tests: __wrap_dlog: use check_expected()
>   multipath tools tests: add strchop() test
>   libmultipath: improve strchop()
>   multipath-tools tests: add test for devt2devname
>   libmultipath: devt2devname(): simplify using libudev
>   libmultipath: create bitfield abstraction
>   libmultipath: use bitfields in group_by_match()
>   libmultipath: util: constify function arguments
>   multipath-tools tests: add unit tests for strlcat
>   libmultipath: strlcpy()/strlcat(): use restrict qualifier
>   libmultipath: constify blacklist code
>   libmultipath: rlookup_binding(): remove newline in log message
>   libmultipath: fix missing initializer warning from clang 3.9
>   libmultipath: fix gcc -Wstringop-overflow warning
>   libmultipath: remove uevent listener failback
>   libmultipath: uevent: use static linkage where possible
>   libmultipath: uevent: inline trivial functions
>   libmultipath: decrease log level of "SCSI target" log message
>   libmultipath: get_udev_uid(): more appropriate error code
>   libmultipath: get_uid(): improve log message on udev failure
>   libmultipath: make sysfs_pathinfo() static and use const
>   libmultipath: pathinfo(): improve a log message
>   libmultipath: pathinfo(): don't filter emtpy devnode names
>   libmultipath: io_err_stat_handle_pathfail(): less error conditions
>   libmultipath: improve libdm logging
>   libmultipath: snprint_devices(): use udev_enumerate
>   libmultipath: snprint_devices(): print hidden/foreign status
>   libmultipath: alloc_path(): initialize pp->initialized
>   libmultipath: alloc_path_with_pathinfo(): treat devname overflow as
>     error
>   libmultipath: log table params in addmap()
>   multipathd: remove set_multipath_wwid()
>   kpartx: print an error message if removing a partition fails
>   kpartx: add missing newline
> 
>  kpartx/devmapper.c               |   2 +-
>  kpartx/kpartx.c                  |   2 +
>  libmultipath/alias.c             |   2 +-
>  libmultipath/blacklist.c         |  34 +-
>  libmultipath/blacklist.h         |  17 +-
>  libmultipath/checkers/directio.c |   2 +-
>  libmultipath/configure.c         |  11 +-
>  libmultipath/defaults.h          |   2 +
>  libmultipath/devmapper.c         |  27 +-
>  libmultipath/discovery.c         |  30 +-
>  libmultipath/dmparser.c          |   2 +-
>  libmultipath/io_err_stat.c       |  25 +-
>  libmultipath/parser.c            |   2 +-
>  libmultipath/pgpolicies.c        |  12 +-
>  libmultipath/print.c             |  90 ++---
>  libmultipath/print.h             |   2 +-
>  libmultipath/propsel.c           |   6 +
>  libmultipath/structs.c           |   1 +
>  libmultipath/uevent.c            | 324 ++---------------
>  libmultipath/uevent.h            |  47 ++-
>  libmultipath/util.c              | 168 ++++-----
>  libmultipath/util.h              |  73 +++-
>  multipathd/main.c                |  14 +-
>  tests/Makefile                   |   3 +-
>  tests/alias.c                    |   4 +-
>  tests/devt.c                     | 192 ++++++++++
>  tests/directio.c                 |  28 +-
>  tests/test-log.c                 |   5 +-
>  tests/uevent.c                   |   4 -
>  tests/util.c                     | 586 ++++++++++++++++++++++++++++---
>  30 files changed, 1081 insertions(+), 636 deletions(-)
>  create mode 100644 tests/devt.c
> 
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

