Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8B9B51BF
	for <lists+dm-devel@lfdr.de>; Tue, 17 Sep 2019 17:44:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 187BC30860BF;
	Tue, 17 Sep 2019 15:44:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6A2D1001281;
	Tue, 17 Sep 2019 15:44:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C5120180085A;
	Tue, 17 Sep 2019 15:44:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8HFiWAB012092 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Sep 2019 11:44:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CD8781001B36; Tue, 17 Sep 2019 15:44:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1B9F1001B34
	for <dm-devel@redhat.com>; Tue, 17 Sep 2019 15:44:32 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
	[209.85.160.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E24580F7C
	for <dm-devel@redhat.com>; Tue, 17 Sep 2019 15:44:32 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id r15so4652779qtn.12
	for <dm-devel@redhat.com>; Tue, 17 Sep 2019 08:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uLQEoOZfN5N7q+GYlXtuSmirCLX4uO8GyLCDt5fCoO8=;
	b=ScsW9pmo8+tKWEYKVvKrRR9lnPoMp4nLMKZB/EXeHR+37u+0pH+uCFVaFxSW+7vTv+
	Yw+gEv3ErveXTDx4AyKcYnK2HZ1A7b3QS5J+aGB97XEDxRs1Rsdh/iTqcU5O9l/IFVV8
	95X7j8THdGFr3ky6l6ohUmDu3F60dByzvJP6FRVZDySeqEFvFJidS8HbYaXg/XR1/mFN
	SF+vwYqIZZKL9oEBmijm9PskNZ/a/FcMyBgM0ROw9r4+zllRKjtPN4WtqO5JxVj6U4IO
	vJUvKJAVtxZrz4mgGE8nAN2P8ox1fMEy/kmxBQaFSFOf9gf8HqjfHGQbj7zxq41BUDKq
	QT7Q==
X-Gm-Message-State: APjAAAWsBu2rdjT+onH8QK8xut5mVmePc/D0kyK+4HTjM6zxLlwtHDxO
	1ddJ/ACFAhR0F8xjGLt44gOH1sfMprm5UPZZ6IzVCKqZE40Y4+zQEQzIRWTThZC8++vvYy62B0p
	s+VANjOoX4PRdgjzmuY6UnEHKLcrEnNA=
X-Received: by 2002:a37:b041:: with SMTP id z62mr4612095qke.94.1568735072026; 
	Tue, 17 Sep 2019 08:44:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyxEhdBZfl0pEzfyaA90EEiKlJkMujEEpAh1/PzWXbHab78z5IuVMiTn/xQdahZ5n84g2NfAahliklWmPOHOIE=
X-Received: by 2002:a37:b041:: with SMTP id z62mr4612068qke.94.1568735071795; 
	Tue, 17 Sep 2019 08:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.02.1909160553360.11421@file01.intranet.prod.int.rdu2.redhat.com>
	<20190916180107.GA725@infradead.org>
	<127b8c4e-a6dc-6d5e-caff-fe1a0ca3a5bb@gmail.com>
	<CAMeeMh9t4LBwJn_CPQgFNa_Tyj22fJYHK-4qAnyn0RXm9RzCnw@mail.gmail.com>
	<20190917140632.GA3728@redhat.com>
	<alpine.LRH.2.02.1909171133100.1876@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.1909171133100.1876@file01.intranet.prod.int.rdu2.redhat.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Tue, 17 Sep 2019 11:44:20 -0400
Message-ID: <CAMeeMh_cq=F3JRZQrLbXA8=DkrvWD7qWNrNyBZdLarWWKcZXAQ@mail.gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, lvm-devel@redhat.com,
	Christoph Hellwig <hch@infradead.org>,
	device-mapper development <dm-devel@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] dm: introduce DM_GET_TARGET_VERSION
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
Content-Type: multipart/mixed; boundary="===============2773920181459468637=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Tue, 17 Sep 2019 15:44:42 +0000 (UTC)

--===============2773920181459468637==
Content-Type: multipart/alternative; boundary="000000000000b398290592c198b0"

--000000000000b398290592c198b0
Content-Type: text/plain; charset="UTF-8"

Makes sense, sorry I missed that detail.

Might it be better to just extend 'dmsetup targets' to take an optional
target-name parameter? When I saw this change, I thought 'dmsetup targets
<name>' surely worked already for the purpose, and was somewhat surprised
when experiment disagreed. Then list_versions() has much the same code
change as in this change, there's a little change in validate_params(), and
it seems less surprising (to me) to extend the existing
target-information-printing dmsetup command than to add another one.

--000000000000b398290592c198b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Makes sense, sorry I missed that detail.<br><br></div=
>Might it be better to just extend &#39;dmsetup targets&#39; to take an opt=
ional target-name parameter? When I saw this change, I thought &#39;dmsetup=
 targets &lt;name&gt;&#39; surely worked already for the purpose, and was s=
omewhat surprised when experiment disagreed. Then list_versions() has much =
the same code change as in this change, there&#39;s a little change in vali=
date_params(), and it seems less surprising (to me) to extend the existing =
target-information-printing dmsetup command than to add another one.<br><br=
><br></div>

--000000000000b398290592c198b0--


--===============2773920181459468637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============2773920181459468637==--

