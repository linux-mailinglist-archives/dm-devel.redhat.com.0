Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7234F4FCC18
	for <lists+dm-devel@lfdr.de>; Tue, 12 Apr 2022 04:01:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649728861;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jd9BkSA3C+Sn0uLLJ+Jq2Gy5SYUTPgpCTPm29zS1M6E=;
	b=cpPf9UzZrEMroRjiYlOxH85QR7bPd1lbsNH76I+2X8ByYQKW2HR/ssdyp2QxtXsjwFxFpx
	6TIePQwme7RvJmgcOLebghHB9mAjcqQEie50bblMizGOzjnzFQ6mo+AD0SdpXULgeMVMa4
	E4c4lhKPwCh3MoTv4mt/k8AlxTttQmI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-JfPsZ2w0OWaOgl_PQ2EOCQ-1; Mon, 11 Apr 2022 22:00:12 -0400
X-MC-Unique: JfPsZ2w0OWaOgl_PQ2EOCQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61E6C86B8A9;
	Tue, 12 Apr 2022 02:00:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 980E9C44B17;
	Tue, 12 Apr 2022 02:00:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2C88E1940373;
	Tue, 12 Apr 2022 02:00:03 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BA6B51947BBF
 for <dm-devel@listman.corp.redhat.com>; Tue, 12 Apr 2022 02:00:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A8BB0407E1C5; Tue, 12 Apr 2022 02:00:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94901400E873;
 Tue, 12 Apr 2022 02:00:01 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 23C200GI011828;
 Mon, 11 Apr 2022 21:00:00 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 23C1xxM9011827;
 Mon, 11 Apr 2022 20:59:59 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 11 Apr 2022 20:59:50 -0500
Message-Id: <1649728799-11790-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [dm-devel] [PATCH 0/9] Add protocol specific config subsection
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: device-mapper development <dm-devel@redhat.com>,
 Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some storage arrays can be accessed using multiple protocols at the same
time.  I've have customers request the ability to set different values
for the path specific timeouts, like fast_io_fail_tmo, based on the
protocol used to access the path. In order to make this possible, this
patchset adds a new protocol subsection to the device subsection and the
overrides section. This allows users to set a device config's path
specific timeouts, such as dev_loss_tmo, fast_io_fail_tmo, and
eh_deadline on a per-protocol basis.

Benjamin Marzinski (9):
  libmultipath: steal the src string pointer in merge_str()
  libmultipath: make protocol_name global
  libmultipath: add a protocol subsection to multipath.conf
  libmultipath: Set the scsi timeout parameters by path
  libmultipath: check the hwentry pctable for path variables
  libmultipath: make snprint_pctable indent a variable amount
  libmultipath: add procotol subsection to overrides
  libmultipath: fix eh_deadline documentation
  libmultipath: Add documentation for the protocol subsection

 libmultipath/config.c      | 116 ++++++++++++++++++++++---
 libmultipath/config.h      |  10 +++
 libmultipath/configure.c   |   5 +-
 libmultipath/dict.c        | 141 ++++++++++++++++++++++++++++++
 libmultipath/discovery.c   | 174 +++++++++++++++++++++----------------
 libmultipath/discovery.h   |   2 +-
 libmultipath/print.c       |  80 +++++++++++++----
 libmultipath/propsel.c     |  89 ++++++++++++++-----
 libmultipath/propsel.h     |   6 +-
 libmultipath/structs.c     |  19 +++-
 libmultipath/structs.h     |   7 +-
 multipath/multipath.conf.5 |  42 +++++++++
 12 files changed, 555 insertions(+), 136 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

