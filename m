Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F27C510C579
	for <lists+dm-devel@lfdr.de>; Thu, 28 Nov 2019 09:52:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574931172;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rqlJ9rLioa0Mkdewg3CmYKzzLdVbqB2+FaugpKGpsLU=;
	b=AA1XzS0i4iU5d+jPe53UraYjliq9DuUcdww3zrCyd2PRHsrZ+Exv9JzNgXESpl64rZlOQ9
	2qAnnr0TJOVA+8ww6rY23+E41lVCQqO+0rTQSBYpDA89lhOxK4+9A3NU1Y65Ufwk2k/GkF
	0YLXmc5o3siHkHDSc1RulBBL60pwNjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-M9cTQ__QOrOwAzGdftv1QA-1; Thu, 28 Nov 2019 03:52:51 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 816CA800D4C;
	Thu, 28 Nov 2019 08:52:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF1FD10013A7;
	Thu, 28 Nov 2019 08:52:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D88874BB65;
	Thu, 28 Nov 2019 08:52:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAQIucnk021015 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 26 Nov 2019 13:56:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7F73C2166B27; Tue, 26 Nov 2019 18:56:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79F0C2166B2A
	for <dm-devel@redhat.com>; Tue, 26 Nov 2019 18:56:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14A698F250E
	for <dm-devel@redhat.com>; Tue, 26 Nov 2019 18:56:34 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be
	[195.130.137.88]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-390-77tkYI6lNreBN0tnEW50NA-1; Tue, 26 Nov 2019 13:56:29 -0500
Received: from ramsan ([84.195.182.253]) by michel.telenet-ops.be with bizsmtp
	id WiwU210015USYZQ06iwUMP; Tue, 26 Nov 2019 19:56:28 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1iZg0h-0002Hb-Sp; Tue, 26 Nov 2019 19:56:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1iZg0h-0000GU-QJ; Tue, 26 Nov 2019 19:56:27 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Nikos Tsironis <ntsironis@arrikto.com>,
	Ilias Tsitsimpis <iliastsi@arrikto.com>,
	Jonathan Corbet <corbet@lwn.net>, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Date: Tue, 26 Nov 2019 19:56:27 +0100
Message-Id: <20191126185627.970-1-geert+renesas@glider.be>
X-MC-Unique: 77tkYI6lNreBN0tnEW50NA-1
X-MC-Unique: M9cTQ__QOrOwAzGdftv1QA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAQIucnk021015
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 28 Nov 2019 03:52:12 -0500
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org
Subject: [dm-devel] [PATCH] docs: device-mapper: Add dm-clone to
	documentation index
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the dm-clone documentation was added, it was not added to the
documentation index, leading to a warning when building the
documentation:

    Documentation/admin-guide/device-mapper/dm-clone.rst: WARNING: document isn't included in any toctree

Fixes: 7431b7835f554f86 ("dm: add clone target")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/admin-guide/device-mapper/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/device-mapper/index.rst b/Documentation/admin-guide/device-mapper/index.rst
index 4872fb6d29524593..ec62fcc8eeceed83 100644
--- a/Documentation/admin-guide/device-mapper/index.rst
+++ b/Documentation/admin-guide/device-mapper/index.rst
@@ -8,6 +8,7 @@ Device Mapper
     cache-policies
     cache
     delay
+    dm-clone
     dm-crypt
     dm-dust
     dm-flakey


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

