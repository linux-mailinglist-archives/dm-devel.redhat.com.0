Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 98533416F0E
	for <lists+dm-devel@lfdr.de>; Fri, 24 Sep 2021 11:36:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632476202;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+/+ITo72Kh9xWw+wBUJv1MHmDgXGzdPKVieyfW936ic=;
	b=U2PIOm03PzPOi3W1gfwsyL8I0ibg6JUiHooxu4duVdhNIHPXw2F/TVjpR3fNSLS+a/+TcB
	wN6mKYZVZnhYieSuP25gj6i1Hhwylc1s3NGEAEit8voQgckJ0mp++vHOLwv+T3zs1/urIo
	z6tbrEXPoUqS03kOAWtG3ZGHM8DRVCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-YkFdgyPPNLubnb7TQ5lMUg-1; Fri, 24 Sep 2021 05:36:40 -0400
X-MC-Unique: YkFdgyPPNLubnb7TQ5lMUg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F189FA0CB8;
	Fri, 24 Sep 2021 09:36:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FE165C1CF;
	Fri, 24 Sep 2021 09:36:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 201BA1809C81;
	Fri, 24 Sep 2021 09:36:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18O9YAUf027232 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Sep 2021 05:34:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 197C31112864; Fri, 24 Sep 2021 09:34:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10F831112C1A
	for <dm-devel@redhat.com>; Fri, 24 Sep 2021 09:34:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C9431801387
	for <dm-devel@redhat.com>; Fri, 24 Sep 2021 09:34:07 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-559-wznvIaLtP9qmlAaJ-ywuOA-1; Fri, 24 Sep 2021 05:34:05 -0400
X-MC-Unique: wznvIaLtP9qmlAaJ-ywuOA-1
Received: by mail-wr1-f51.google.com with SMTP id t8so25498170wrq.4
	for <dm-devel@redhat.com>; Fri, 24 Sep 2021 02:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5Jzfb0FRbYxIg+hAK/rcnJD3WreE2B6j7XWlue4cfSU=;
	b=qm5pDvef38fOfUwjE500OdX1eqND8Nnh05oNXfBQWR7TZWSDYmBr4skn4ZjWiOQ9ah
	N46lwFnu/b08TvYKJDyWr/4/e88i9WsDfBYb72RW29s8JbCDgULYiwjdtYx/9u9Je8+n
	xAag4ElWpg9pfDMiA90G6J+2vhLjhO2kEHhq9SKQJSXAQiylE7d96XDLFHat0qfNk+P5
	cvwpPnbC3Q8HcEHnwECFvs9QDmKHEhJ33UxvIDWoWoHstw527v/D7VC1Ku63D+sdBH+A
	DvPaJImvpQKj2zhSiIszlaR0Eet4OpdsP9S/MZ/Bb1UGGbUSUe1DcF4rTDhCjgPMfhfL
	IWeg==
X-Gm-Message-State: AOAM533JszB/KhxRBvqpK+exO9XOMYfXd6TwRh5wHoXTeMSEdjhwkMlh
	zbPfbUB/acROqGVW0/9Eg9NDzfOuAgGGM4Yse9z7veHLLnPxe8P8bomWWKv2bl86ZU7HU1aPTpK
	ePOMJlw21a8wUgLmSI5ZAz9R7neaQushetVphdUdNiIyHmHzGDfUSe8c4HALChEC8RA==
X-Google-Smtp-Source: ABdhPJzn89wr5JECMM/JtjPN4YXdjVNKNjOLxo1FAUiJEvl0eTfu106/A2oS5pfYDu3Jn9NQlOTZIA==
X-Received: by 2002:adf:f4ca:: with SMTP id h10mr10259465wrp.159.1632476043898;
	Fri, 24 Sep 2021 02:34:03 -0700 (PDT)
Received: from localhost (ip5f5bf6f3.dynamic.kabel-deutschland.de.
	[95.91.246.243]) by smtp.gmail.com with ESMTPSA id
	i18sm7662423wrn.64.2021.09.24.02.34.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Sep 2021 02:34:03 -0700 (PDT)
From: Luca BRUNO <luca.bruno@coreos.com>
To: dm-devel@redhat.com
Date: Fri, 24 Sep 2021 09:34:01 +0000
Message-Id: <20210924093401.17852-1-luca.bruno@coreos.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: mwilck@suse.com
Subject: [dm-devel] [PATCH] multipathd.socket: add missing conditions from
	service unit
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This aligns 'multipathd' socket and service units, by adding the
start conditions that are set on the service but not on the socket.
It should help avoiding situations where the socket unit ends up
marked as failed after hitting its retry-limit.

Fixes: https://github.com/opensvc/multipath-tools/issues/15
Signed-off-by: Luca BRUNO <luca.bruno@coreos.com>
---
 multipathd/multipathd.socket | 3 +++
 1 file changed, 3 insertions(+)

diff --git multipathd/multipathd.socket multipathd/multipathd.socket
index 0ed4a1f7..c777e5e3 100644
--- multipathd/multipathd.socket
+++ multipathd/multipathd.socket
@@ -1,6 +1,9 @@
 [Unit]
 Description=multipathd control socket
 DefaultDependencies=no
+ConditionKernelCommandLine=!nompath
+ConditionKernelCommandLine=!multipath=off
+ConditionVirtualization=!container
 Before=sockets.target
 
 [Socket]
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

