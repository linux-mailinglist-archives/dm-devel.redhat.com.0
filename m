Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F5C58E212
	for <lists+dm-devel@lfdr.de>; Tue,  9 Aug 2022 23:47:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660081659;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fOcesACCcc/Clj/L28jYonYJt78voPbpGYLoD3LNMgE=;
	b=e0gHCkGm7bv5VaFtfR8GwzsJ9f2gmbKWsQ0Bl3w4Zp5mbiP1rJJI66wgxKzBdUVgVKfy35
	OIZNX9ZVD1IaLC57v7xRaIMHL9EgTy7va6V2dB+OhnoxAhS7kcGrn+eIjevvMOJZyxj1KB
	Uy8Ur23TTmgi2eAtlyHDH9+MlLxwKsU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-I4yZdj5yOd6SGqL3f4zEYQ-1; Tue, 09 Aug 2022 17:46:38 -0400
X-MC-Unique: I4yZdj5yOd6SGqL3f4zEYQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA1391C0014D;
	Tue,  9 Aug 2022 21:46:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B712492CA4;
	Tue,  9 Aug 2022 21:46:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 111331946A5D;
	Tue,  9 Aug 2022 21:46:32 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 31E781946A41
 for <dm-devel@listman.corp.redhat.com>; Tue,  9 Aug 2022 21:46:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1786F2026D2D; Tue,  9 Aug 2022 21:46:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF9332026D4C;
 Tue,  9 Aug 2022 21:46:30 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 279LkTA0023316;
 Tue, 9 Aug 2022 16:46:29 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 279LkTdp023315;
 Tue, 9 Aug 2022 16:46:29 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue,  9 Aug 2022 16:46:25 -0500
Message-Id: <1660081588-23278-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [dm-devel] [PATCH 0/3] mulitpathd: Handle losing all paths in
 update_map
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When users rapidly add and remove paths, it's possible for multipathd to
delay updating the multipath device, and when if finally calls
update_map(), find out that no paths remain for the device. When this
happens, multipathd should act just like all the paths had been removed,
attempting to remove the device, while respecting the flush_on_last_del
and deferred_remove settings. Instead multipathd was simply reloading
the map with no paths. This patchset fixes this.

Benjamin Marzinski (3):
  multipathd: factor out the code to flush a map with no paths
  libmultipath: return success if we raced to remove a map and lost
  multipathd: Handle losing all path in update_map

 libmultipath/devmapper.c |  4 +++
 multipathd/main.c        | 64 +++++++++++++++++++++-------------------
 2 files changed, 37 insertions(+), 31 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

