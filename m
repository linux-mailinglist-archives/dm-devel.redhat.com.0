Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF7D3C9D50
	for <lists+dm-devel@lfdr.de>; Thu, 15 Jul 2021 12:54:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-_FsmcdTuMkWT9Bo85pku7g-1; Thu, 15 Jul 2021 06:54:51 -0400
X-MC-Unique: _FsmcdTuMkWT9Bo85pku7g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 962DC100C612;
	Thu, 15 Jul 2021 10:54:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72E0760936;
	Thu, 15 Jul 2021 10:54:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60BDF4EA38;
	Thu, 15 Jul 2021 10:54:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16FAqiUE015549 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Jul 2021 06:52:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F08B220286F4; Thu, 15 Jul 2021 10:52:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC8862028693
	for <dm-devel@redhat.com>; Thu, 15 Jul 2021 10:52:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 254858037AB
	for <dm-devel@redhat.com>; Thu, 15 Jul 2021 10:52:41 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-253-uIliARbIOIWECiuP5qA_TA-1; Thu, 15 Jul 2021 06:52:38 -0400
X-MC-Unique: uIliARbIOIWECiuP5qA_TA-1
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4008222408;
	Thu, 15 Jul 2021 10:52:37 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 1242D13AB7;
	Thu, 15 Jul 2021 10:52:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap1.suse-dmz.suse.de with ESMTPSA id G0r8AXUT8GDQIAAAGKfGzw
	(envelope-from <mwilck@suse.com>); Thu, 15 Jul 2021 10:52:37 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 15 Jul 2021 12:52:14 +0200
Message-Id: <20210715105223.30463-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 16FAqiUE015549
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 0/9] multipath-tools: use variable-size string
	buffers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Current libmultipath contains a lot of code writing text to pre-allocated
string buffers of fixed size while trying to avoid buffer overflows
or truncation of the output string. This code is, at least in part,
hard to verify and hard to read, as buffer sizes and positions need to
be checked after every additon of text. It requires either allocating large
buffers in advance, or risking to loose data, or re-allocating buffers
and starting over again.

This patch set changes this by switching almost entirely to text buffers
that are dynamically allocated and grow automatically as text is added.

The first patch, which was the initial motivation of the set, doesn't
need growing buffers, it just overcomes the PARAMS_SIZE limitation by
copying data from libdm. However if the PARAMS_SIZE limitation was dropped
when reading from the kernel, it made sense to drop it for constructing
PARAMS, too. This motivated the implementation of the strbuf API (patch 2),
and using it in assemble_map (patch 3). The API was then consequently used
elswhere in libmultipath too, where strings are built up in pieces (patch 4,
5, 8, 9). These additional changes are huge because of large number of
affected "snprint_xyz" functions and respective function calls, but most
of the changes are mechanical and follow always the same overall idea.

Finally, patch 6 and 7 are cleanups which I found necessary while working
on print.c.

Regression testing: added a test suite for strbuf itself, made sure
all tests cases (which involve quite a bit of printf_xyz() functions) still
pass, and compared output of lots of interactive multipathd and multipath
commands before and after the change.

Note that "multipathd show config" / "multipath -t" will show some minor
differences in the output, because the current code omits quotes for some
output value fields. With this patch set, all string values are quoted.

The patch set is available also on my "tip" branch:
https://github.com/openSUSE/multipath-tools/tree/tip.

Martin Wilck (9):
  libmultipath: variable-size parameters in dm_get_map()
  libmultipath: strbuf: simple api for growing string buffers
  libmultipath: variable-size parameters in assemble_map()
  libmultipath: use strbuf in dict.c
  libmultipath: use strbuf in print.c
  libmultipath: print.c: fail hard if keywords are not found
  libmultipath: print.h: move macros to print.c
  libmultipath: use strbuf in alias.c.
  multipathd: use strbuf in cli.c

 libmultipath/Makefile                    |    2 +-
 libmultipath/alias.c                     |   84 +-
 libmultipath/blacklist.c                 |   13 +-
 libmultipath/configure.c                 |   18 +-
 libmultipath/configure.h                 |    3 +-
 libmultipath/devmapper.c                 |   44 +-
 libmultipath/devmapper.h                 |    4 +-
 libmultipath/dict.c                      |  313 ++--
 libmultipath/dict.h                      |   19 +-
 libmultipath/discovery.c                 |   13 +-
 libmultipath/dmparser.c                  |   47 +-
 libmultipath/dmparser.h                  |    2 +-
 libmultipath/foreign.c                   |   78 +-
 libmultipath/foreign.h                   |   13 +-
 libmultipath/foreign/nvme.c              |  100 +-
 libmultipath/generic.c                   |   26 +-
 libmultipath/generic.h                   |   17 +-
 libmultipath/libmultipath.version        |   21 +-
 libmultipath/parser.c                    |   50 +-
 libmultipath/parser.h                    |   17 +-
 libmultipath/print.c                     | 1839 ++++++++++------------
 libmultipath/print.h                     |  131 +-
 libmultipath/prioritizers/weightedpath.c |   71 +-
 libmultipath/propsel.c                   |  147 +-
 libmultipath/strbuf.c                    |  207 +++
 libmultipath/strbuf.h                    |  168 ++
 libmultipath/structs.h                   |    1 -
 libmultipath/structs_vec.c               |   11 +-
 libmultipath/util.c                      |    5 +
 libmultipath/util.h                      |    1 +
 multipathd/cli.c                         |   94 +-
 multipathd/cli_handlers.c                |  349 ++--
 multipathd/main.c                        |   20 +-
 tests/Makefile                           |    3 +-
 tests/alias.c                            |   41 +-
 tests/strbuf.c                           |  412 +++++
 36 files changed, 2312 insertions(+), 2072 deletions(-)
 create mode 100644 libmultipath/strbuf.c
 create mode 100644 libmultipath/strbuf.h
 create mode 100644 tests/strbuf.c

-- 
2.32.0


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

