Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E26C338C
	for <lists+dm-devel@lfdr.de>; Tue,  1 Oct 2019 13:58:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B245C3084025;
	Tue,  1 Oct 2019 11:58:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A9A8104812A;
	Tue,  1 Oct 2019 11:58:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A93824EE6A;
	Tue,  1 Oct 2019 11:58:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x91BwRnH020654 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Oct 2019 07:58:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 996A062A66; Tue,  1 Oct 2019 11:58:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90A5E98AC
	for <dm-devel@redhat.com>; Tue,  1 Oct 2019 11:58:19 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 014DD80F7C
	for <dm-devel@redhat.com>; Tue,  1 Oct 2019 11:58:18 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id y19so15167551wrd.3
	for <dm-devel@redhat.com>; Tue, 01 Oct 2019 04:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Mz8mujd/cbIj4LCwvkeuHB0Jnp7YUXJ8uMt/TpTIIT4=;
	b=mmht+NIw6XT+bPA5QBB5i4EV5CL2sx1F6PaN/gq6u/tBlgWHTKctI/VooB6vGRLTok
	xu87MUcPE/Cc1bIb4JJnQZ9IcVswvcyRmG9j7GiPVtLvVqPkCeIelIiXcuKFZm9Msj85
	/tISlNmRmc8pCwtIQGkrOt011Y6b29gNHvkUW2pDgS9ibGnnYt2Uqih4X5hiNlLm+nL6
	O4HEitprQIetHLUpSmCxBM0e50Rc+5RVzEzhnbwYk/xNEzzVd4FLx2EuZs94qAJBGkdA
	pKL9umv/9pR06ZdS1NXdeoq6p75Nn5Tp2mQXfdOlWytPxo1ky9lzqzyMkiE6vNbiPZuy
	DNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Mz8mujd/cbIj4LCwvkeuHB0Jnp7YUXJ8uMt/TpTIIT4=;
	b=TSixCrRofOgOJ19CpMNAEsT4d+YCRCch262X67xKTGQpgkk9iCURxXOqftGGkmQpU8
	oZSVkiIzZoubER5v1f1tPWNCrj76odEpcr3g9IcKX/Lq8os/xBHXWQCTux7n8352GOV9
	GDr426coTJcxG4efK92hN0eiH/xfri0njyaBNLMLN+19cHIzzsagVgRhEGfFMK8Xtc/J
	3FxH85DJaUGdSa27R5Cv/pOp0i7xMEG9hTcjcvX5t72yrK/D7dcloVlHj2oSNxR6gH6/
	P0+iartCawoBhthihIl2WkRdAwLtMqZNtammOtfErDQRS33ONsc+lOoubRTQEBWMZo+M
	Hg+Q==
X-Gm-Message-State: APjAAAWUuJz1FMLHvyfL586V7EBbQRQHfVrpYSy9TBUrgaCRf2K2tcEq
	sY9eSDHHYAgnjujLXvhkGTuYhg==
X-Google-Smtp-Source: APXvYqxkykm/VpKvcmJl0VgrxZVRnE685GNMAxEo6uxB80v3BqVVyudgdGKVA8TQ2OF5fGtA4KRmJw==
X-Received: by 2002:a5d:4f91:: with SMTP id d17mr461216wru.329.1569931096746; 
	Tue, 01 Oct 2019 04:58:16 -0700 (PDT)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	b12sm15589174wrt.21.2019.10.01.04.58.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Oct 2019 04:58:15 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Tue,  1 Oct 2019 14:57:46 +0300
Message-Id: <20191001115747.4473-1-ntsironis@arrikto.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 01 Oct 2019 11:58:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Tue, 01 Oct 2019 11:58:18 +0000 (UTC) for IP:'209.85.221.48'
	DOMAIN:'mail-wr1-f48.google.com' HELO:'mail-wr1-f48.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.48 mail-wr1-f48.google.com 209.85.221.48
	mail-wr1-f48.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: ntsironis@arrikto.com, guru2018@gmail.com
Subject: [dm-devel] [PATCH 0/1] dm snapshot: Fix bug in COW throttling
	mechanism causing deadlocks
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 01 Oct 2019 11:58:52 +0000 (UTC)

Hello,

This patch fixes the deadlock issue reported in this thread:
https://www.redhat.com/archives/dm-devel/2019-September/msg00168.html.

Although I have been really careful preparing this patch, in order to
avoid any further issues, any extra review would be greatly appreciated.

Thanks,
Nikos

Nikos Tsironis (1):
  dm snapshot: Fix bug in COW throttling mechanism causing deadlocks

 drivers/md/dm-snap.c | 99 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 90 insertions(+), 9 deletions(-)

-- 
2.11.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
