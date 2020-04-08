Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 927501A2B5C
	for <lists+dm-devel@lfdr.de>; Wed,  8 Apr 2020 23:41:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586382077;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TZl8eaL+c4yzbdnK9Y2jFUq+1IkRCREOoqgyfYsK1Nc=;
	b=Y1GOQShErtcRBoxTP/HazWQo9U2mhDh8iwEma+ukwCEP1bv1jtVjXEABCdlF52oJtSOdRL
	01maDP71nApTwJxZ85RKDkioTEPThe62dtSgVqSOwrkmTf72cB5FsO2RXpTEq6EouxADt7
	9RN6qNUNE0CbI0onC7ExV9SOh+KgzsE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-zO2Vx_5PPM6W-5L0v9dkvw-1; Wed, 08 Apr 2020 17:41:15 -0400
X-MC-Unique: zO2Vx_5PPM6W-5L0v9dkvw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F7C5192D785;
	Wed,  8 Apr 2020 21:41:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01A79118F24;
	Wed,  8 Apr 2020 21:41:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96F6793A8C;
	Wed,  8 Apr 2020 21:40:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 038LeloB006704 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Apr 2020 17:40:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 79909EC4D8; Wed,  8 Apr 2020 21:40:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75B02114CB5
	for <dm-devel@redhat.com>; Wed,  8 Apr 2020 21:40:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B50668F7A09
	for <dm-devel@redhat.com>; Wed,  8 Apr 2020 21:40:44 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-417-uKr7WnVyMzueTeMyqapqfA-1; Wed, 08 Apr 2020 17:40:42 -0400
X-MC-Unique: uKr7WnVyMzueTeMyqapqfA-1
Received: by mail-wm1-f68.google.com with SMTP id c195so1063476wme.1
	for <dm-devel@redhat.com>; Wed, 08 Apr 2020 14:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wrsdLRE7Xx1+50Hrg2HuLP+LMSKZMrZzQtG7GEac7lk=;
	b=K/Vxvj1Z5r1VL46xEKBCVkKAlfx5mCO+xK+ei7EvkV8s6gV7FF/TfAgf/S+4GNMFVq
	+BiEz8atvOsaY48vjlRCWehRhzIk30+SLA9hMA5/aJ3vNGMKyd5C712kHHCv5mhKKkPR
	DQZerFL93dmZw896sCARuMQJdltEvBnnpDfmUrBX2/yaIoEw/AG7+d+SkhQ/LY29cFRx
	YvSQk45Iz50wvmdwyldzYJAJNmWF73WNeJnhr3NlTTZL4I39MyHUsKsF2IRsGD5erFpl
	n02MxC+mAYt1yyHc/OM6QeMCZF3ZB5utonh0ujq9eE97nBFCTzJ34iIWYRy5qGdn3SqP
	X37Q==
X-Gm-Message-State: AGi0PuYt8vA0TTRToqVQd9CSrK4ZSPpyi4CmxcPi+A0k40lfyzPBIS8O
	kAt13QEJ4TjgiT181JIh9v07d05dzL0=
X-Google-Smtp-Source: APiQypIFdHxTcXmgtwHUcIKrt+L2R0+ZiqLqX/lKMhXYTTQjeuDmGZNL3edmzT0o9JPnD7WtrBMiiQ==
X-Received: by 2002:a05:600c:2c04:: with SMTP id
	q4mr6365495wmg.7.1586382040769; 
	Wed, 08 Apr 2020 14:40:40 -0700 (PDT)
Received: from merlot.mazyland.net (39.35.broadband4.iol.cz. [85.71.35.39])
	by smtp.googlemail.com with ESMTPSA id
	q187sm950926wma.41.2020.04.08.14.40.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Apr 2020 14:40:40 -0700 (PDT)
From: Milan Broz <gmazyland@gmail.com>
To: dm-devel@redhat.com
Date: Wed,  8 Apr 2020 23:40:08 +0200
Message-Id: <20200408214008.209424-1-gmazyland@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 038LeloB006704
X-loop: dm-devel@redhat.com
Cc: Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH] dm-integrity: Document allow_discard option.
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

This patch adds decription of the allow_discard option
added in commit 84597a44a9d86ac949900441cea7da0af0f2f473.

Signed-off-by: Milan Broz <gmazyland@gmail.com>
---
 .../admin-guide/device-mapper/dm-integrity.rst    | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-integrity.rst b/Documentation/admin-guide/device-mapper/dm-integrity.rst
index c00f9f11e3f3..8439d2ae689b 100644
--- a/Documentation/admin-guide/device-mapper/dm-integrity.rst
+++ b/Documentation/admin-guide/device-mapper/dm-integrity.rst
@@ -182,12 +182,15 @@ fix_padding
 	space-efficient. If this option is not present, large padding is
 	used - that is for compatibility with older kernels.
 
-
-The journal mode (D/J), buffer_sectors, journal_watermark, commit_time can
-be changed when reloading the target (load an inactive table and swap the
-tables with suspend and resume). The other arguments should not be changed
-when reloading the target because the layout of disk data depend on them
-and the reloaded target would be non-functional.
+allow_discards
+	Allow block discard requests (a.k.a. TRIM) for the integrity device.
+	Discards are only allowed to devices using internal hash.
+
+The journal mode (D/J), buffer_sectors, journal_watermark, commit_time and
+allow_discards can be changed when reloading the target (load an inactive
+table and swap the tables with suspend and resume). The other arguments
+should not be changed when reloading the target because the layout of disk
+data depend on them and the reloaded target would be non-functional.
 
 
 The layout of the formatted block device:
-- 
2.26.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

