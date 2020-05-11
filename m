Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 29F471CE843
	for <lists+dm-devel@lfdr.de>; Tue, 12 May 2020 00:40:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589236833;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T7+YcIj1Ed17uIZgXQyAz0ZcFurNHlhPv0eE+XyEnA8=;
	b=MhJ6Hhg6v1ZvjH3TnB5npPy31wnkvGOitv9zpVq/U6TUgOa4JSyBBKy53GRhunJkzdsrVO
	o5v0cWCbTYQG/cD1WSPPdWuFhaHwxNr7sNB4RCHEDBsIeWK3pRo8TIoFbHRVGfwhsVPRzC
	3KeSPWxxW2kTwCTyvde3gapg8siqT/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-yzJPASGqOBixv_NyMBMJuQ-1; Mon, 11 May 2020 18:40:30 -0400
X-MC-Unique: yzJPASGqOBixv_NyMBMJuQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94A1E19200C8;
	Mon, 11 May 2020 22:40:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 715277049C;
	Mon, 11 May 2020 22:40:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D2921809543;
	Mon, 11 May 2020 22:40:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BMdxEu016066 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 18:39:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A4167DBB05; Mon, 11 May 2020 22:39:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A03FDDBB08
	for <dm-devel@redhat.com>; Mon, 11 May 2020 22:39:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCE33811E7A
	for <dm-devel@redhat.com>; Mon, 11 May 2020 22:39:56 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-97-dGehagmcNU6cTk4RaVtn6g-1;
	Mon, 11 May 2020 18:39:53 -0400
X-MC-Unique: dGehagmcNU6cTk4RaVtn6g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 99EA7AD89;
	Mon, 11 May 2020 22:39:54 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 12 May 2020 00:39:20 +0200
Message-Id: <20200511223931.18261-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04BMdxEu016066
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 00/11] Minor fixes for multipath-tools
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe, hi Ben,

This series fixes a couple of issues I recently found with the 32bit build
of multipath-tools, and after integrating our CI into the automated builds
on our build server.

Regards
Martin

Martin Wilck (11):
  multipath-tools: Makefile: more dependency fixes for parallel build
  multipath-tools: Makefile.inc: separate out OPTFLAGS
  multipath-tools: Makefile.inc: allow user settings for LDFLAGS
  multipath-tools: Makefile.inc: set -Wno-error=clobbered
  libmultipath: discovery.c: use %z qualifier for size_t
  libmultipath: eliminate more signed/unsigned comparisons
  libmultipath: set_uint: fix parsing for 32bit
  multipath-tools tests/Makefile: add -lmpathcmd to LIBDEPS
  multipath tools tests/Makefile: Fix OBJDEPS for hwtable-test
  multipath-tools tests/test-lib.c: drop __wrap_is_claimed_by_foreign
  multipath-tools tests/directio: fix -Wmaybe-uninitalized warning

 Makefile                              |  5 +++--
 Makefile.inc                          | 16 ++++++++--------
 libmpathpersist/mpath_pr_ioctl.c      |  2 +-
 libmultipath/dict.c                   | 11 +++++++----
 libmultipath/discovery.c              | 16 ++++++++--------
 libmultipath/print.c                  | 12 ++++++------
 libmultipath/prioritizers/alua_spc3.h |  2 +-
 multipathd/cli_handlers.c             | 20 ++++++++++----------
 multipathd/main.c                     |  2 +-
 tests/Makefile                        |  4 ++--
 tests/directio.c                      |  2 +-
 tests/test-lib.c                      |  6 ------
 12 files changed, 48 insertions(+), 50 deletions(-)

-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

