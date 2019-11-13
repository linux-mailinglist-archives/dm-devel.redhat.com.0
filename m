Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id AB38710269C
	for <lists+dm-devel@lfdr.de>; Tue, 19 Nov 2019 15:27:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574173630;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:resent-to:
	 resent-from:resent-message-id:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=cHTlLA7alXPDb1UnV7M5jhzT3INpcd7dkgeQV4+3jE0=;
	b=L+SVfXOE3jfF+EjK+K8A87d7zQodk7aYi1L2FyVe3gX8Fw+UmbULo0fRjov0u8CZYmJjgH
	X0XvgZldbUjSlHRBxVU0bWgwSAfYp4mrxJsfiORUsnQLQnkmnyPAe5uYRci6DAvuP4YLrm
	k0oWW0Q/GZoedU9NCU35To1SwDZ1/So=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-Kd85ZNHjMwWv2auYYMwNcw-1; Tue, 19 Nov 2019 09:27:07 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F4BC8E88A3;
	Tue, 19 Nov 2019 14:26:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AEBA627DE;
	Tue, 19 Nov 2019 14:26:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D55154BB65;
	Tue, 19 Nov 2019 14:26:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJEQY7m027326 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 09:26:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2A2811758A; Tue, 19 Nov 2019 14:26:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 239B21758C
	for <dm-devel@redhat.com>; Tue, 19 Nov 2019 14:26:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94FC21011A60
	for <dm-devel@redhat.com>; Tue, 19 Nov 2019 14:26:31 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-357-IoHySNzROWOF20PhiT4_Xg-1; Tue, 19 Nov 2019 09:26:29 -0500
Received: by mail-lj1-f196.google.com with SMTP id r7so23557954ljg.2
	for <dm-devel@redhat.com>; Tue, 19 Nov 2019 06:26:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-to:resent-date
	:resent-message-id:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=APXfuG82A+VYQSkpqfeuJieTcNwnepuIQxnGzHt+UyY=;
	b=OQJm5Mg1wftRc28mwC+kJ2oXAplV3xgubH6ogSR07uKtj8r9wN52CgIeYWYmr9XJv1
	XDDrTezoQXV/BQlDuT1GJ7UbllBLN0AJwtsD7qPMx4whGFlBvoqXxXER3PH2PDZ+mbP0
	EpTIUBAygpeKoCmt3wt+3zvopFplS5DzVbRK1lHGUKpNwE4OSEVuIuEUYcUO5o/8Fz0I
	7SX+gKYlEBIwBLiKuxfA0ACBv6C+0I5ysxno5YPINnxZroSoxosJRFBhnouxZvQfjlIw
	CTTnJe7uU64atWRFzDtwIpYaszQwFXolXMVeCiSA3vePObZs0fhEDv+tnojQWOmPL+3o
	796Q==
X-Gm-Message-State: APjAAAW3RItCxJeRMNaYQdSSDIdpDZ0z4awd9OUAiisIXF9zPyDMkX5+
	YLpfGRnx1fuiIG5BLlYKTG/DieWc+3w=
X-Google-Smtp-Source: APXvYqxgY4FU7G/uUg1sYthe6J6xStARZ2od7ByuFkrI1xnihQKckIiZpAbQvBwHqy2CKJjSr8V0ng==
X-Received: by 2002:a2e:9a08:: with SMTP id o8mr4374767lji.214.1574173587727; 
	Tue, 19 Nov 2019 06:26:27 -0800 (PST)
Received: from [10.94.250.118] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	r15sm4699308lfp.36.2019.11.19.06.26.27 for <dm-devel@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Nov 2019 06:26:27 -0800 (PST)
Resent-From: Nikos Tsironis <ntsironis@arrikto.com>
Resent-To: dm-devel@redhat.com
Resent-Date: Tue, 19 Nov 2019 16:26:24 +0200
Resent-Message-ID: <14674023-9480-5344-3046-2041ed8efdd9@arrikto.com>
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	y75sm1070176lff.58.2019.11.13.05.10.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Nov 2019 05:10:59 -0800 (PST)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: mpatocka@redhat.com, tglx@linutronix.de, linux-rt-users@vger.kernel.org,
	msnitzer@redhat.com, dm-devel@redhat.com, linux-kernel@vger.kernel.org
Date: Wed, 13 Nov 2019 15:10:42 +0200
Message-Id: <20191113131042.7719-1-ntsironis@arrikto.com>
In-Reply-To: <alpine.LRH.2.02.1911121110430.12815@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1911121110430.12815@file01.intranet.prod.int.rdu2.redhat.com>
X-MC-Unique: IoHySNzROWOF20PhiT4_Xg-1
X-MC-Unique: Kd85ZNHjMwWv2auYYMwNcw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAJEQY7m027326
X-loop: dm-devel@redhat.com
Cc: ntsironis@arrikto.com, dwagner@suse.de, bigeasy@linutronix.de,
	iliastsi@arrikto.com, linux-fsdevel@vger.kernel.org, swood@redhat.com
Subject: [dm-devel] [PATCH RT 2/2 v4] list_bl: avoid BUG when the list is
	not locked
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

list_bl would crash with BUG() if we used it without locking.
dm-snapshot uses its own locking on realtime kernels (it can't use
list_bl because list_bl uses raw spinlock and dm-snapshot takes other
non-raw spinlocks while holding bl_lock).

To avoid this BUG we deactivate the list debug checks for list_bl on
realtime kernels.

This patch is intended only for the realtime kernel patchset, not for
the upstream kernel.

Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
Reviewed-by: Mikulas Patocka <mpatocka@redhat.com>
---
 include/linux/list_bl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/list_bl.h b/include/linux/list_bl.h
index da38433240f5..3585b2f6b948 100644
--- a/include/linux/list_bl.h
+++ b/include/linux/list_bl.h
@@ -25,7 +25,7 @@
 #define LIST_BL_LOCKMASK=090UL
 #endif
=20
-#ifdef CONFIG_DEBUG_LIST
+#if defined(CONFIG_DEBUG_LIST) && !defined(CONFIG_PREEMPT_RT_BASE)
 #define LIST_BL_BUG_ON(x) BUG_ON(x)
 #else
 #define LIST_BL_BUG_ON(x)
--=20
2.11.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

