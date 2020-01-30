Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8313314DFFB
	for <lists+dm-devel@lfdr.de>; Thu, 30 Jan 2020 18:35:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580405708;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QeJtelekIKfK1edIa3bz6CpYWDYvPY8irY8W2SafeQY=;
	b=MubcTqLA+h9Afu+kUNpjMv+75w2wgLLQiF3VDSHZvqcl3FMONXaNFNq2vsou+TL8/VNaBe
	nHAh9pG+Gb3jWkT6iomdMfqv9fV2FEdG8E/ubAx9lCuXGQs4UO6Ccw4X/CSlzKTmdg56O+
	kzWJgS1yTOtW2jg0we5Lk+Cm+OEXB1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-e0OizFDZNxC1LeIVCQt7VQ-1; Thu, 30 Jan 2020 12:35:05 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19374801E67;
	Thu, 30 Jan 2020 17:34:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 505541001B03;
	Thu, 30 Jan 2020 17:34:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A0A318089C8;
	Thu, 30 Jan 2020 17:34:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00UHYUhN003420 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 30 Jan 2020 12:34:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DDB4B84D93; Thu, 30 Jan 2020 17:34:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (ovpn-205-84.brq.redhat.com
	[10.40.205.84])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3995B8882D;
	Thu, 30 Jan 2020 17:34:28 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1ixDhx-0002Bj-LM; Thu, 30 Jan 2020 18:34:26 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Thu, 30 Jan 2020 18:34:15 +0100
Message-Id: <20200130172539.890730920@debian-a64.vm>
User-Agent: quilt/0.65
Date: Thu, 30 Jan 2020 18:25:39 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 0/3] dm-integrity: make it possible to change the
	size of dm-integrity device
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
X-MC-Unique: e0OizFDZNxC1LeIVCQt7VQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

This patchset makes it possible to enlarge or shrink a dm-integrity device.

Without this patchset, dm-integrity would set the field
provided_data_sectors only once and would not change it when being
reloaded with different size.

This patch makes dm-integrity update provided_data_sectors at each
invocation.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

