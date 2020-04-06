Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 16A3B19EEC5
	for <lists+dm-devel@lfdr.de>; Mon,  6 Apr 2020 02:03:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586131408;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8VvH7dhULh6ldYpA1H9p4fP+KkWrw9obNXzeCXpGT4U=;
	b=ZJPWPQCUk4UdBsl5F9UC2wGd3TkRTkf4TBQBMP1d+mTymsUf498EzFvGYnerjb896QVwmA
	MdIbFGXwuDsuBwuReeYTtDCeuo9AYCePmHNOL2w+KHUWNvQF/pByblSV8s52dZmUeRJS9r
	gHA8gEGDEVwaxsIFKEfsSz8rThHq6QI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-2lyFHoppPu6a1pQyCqfJFg-1; Sun, 05 Apr 2020 20:03:25 -0400
X-MC-Unique: 2lyFHoppPu6a1pQyCqfJFg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E3D513F8;
	Mon,  6 Apr 2020 00:03:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4468A90CE0;
	Mon,  6 Apr 2020 00:03:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89FC818089CD;
	Mon,  6 Apr 2020 00:02:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03602b6K006904 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 5 Apr 2020 20:02:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8A2CF1C734; Mon,  6 Apr 2020 00:02:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 863DB1C735
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 00:02:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFBED8E3860
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 00:02:34 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
	[209.85.166.181]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-238-h4uWdmdNPu2osmkqCLD-AQ-1; Sun, 05 Apr 2020 20:02:30 -0400
X-MC-Unique: h4uWdmdNPu2osmkqCLD-AQ-1
Received: by mail-il1-f181.google.com with SMTP id a6so13046287ilr.4
	for <dm-devel@redhat.com>; Sun, 05 Apr 2020 17:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=lrCiTHYDRrhW4vR0QoznZu4jn41w5HckktgI91zaQWc=;
	b=C62s9bITs8QuM+A1JpGeOUbE6SRizp+pHo9mVG+h7FWNshLWu0dbtRIqG1LUCTFtKk
	XuL2DGzbAyvBV/MQL49FMd1JIEfWmhMJ9uwyu6iSTi13g9Z6r+fkYRsC0ezF0HwvnZXq
	dEJxCFwN7qlByFBhcAMXkn8VSEGZUwtnDt0ffyIXcxcxbk0Un6PekEhhjPhWKo89oVyc
	q4WiTMaq7yATXHYk0OwTTk8GFWdhCASZJqlypfSevEiLFkxbAptRjlP6r2A4lbMLLPPa
	QylRXguSMdrWzIqIUOgK24Zx3mVDMZlndHDGPVIdyPOSNdZgCIE68Sp6mRWmN1heSW/7
	SZ7Q==
X-Gm-Message-State: AGi0Pualh1FYLQTEbGLuXBFB5xfdaFxQ4jCIyKLZFalFny9FYvxs9ZNq
	biBA4+fHhDcU/6fKv6SyhG3WWd2IxzOmQmgjKAOTQAehBD0=
X-Google-Smtp-Source: APiQypKuH/+Sy+fnbDTmRV/9KaqNdXZMUIHOJLF9DUgpeq7Ic5aANykv1ucnlqc6+0299aS0iQYj/zNu93eheZK2NKY=
X-Received: by 2002:a92:77c2:: with SMTP id
	s185mr18400843ilc.297.1586131349343; 
	Sun, 05 Apr 2020 17:02:29 -0700 (PDT)
MIME-Version: 1.0
From: Drew Hastings <dhastings@crucialwebhost.com>
Date: Sun, 5 Apr 2020 17:02:18 -0700
Message-ID: <CAN-y+EKqXowOufjVs=BKwZQc+HFMk1_iQ-+H+oisK6D+eBGp3A@mail.gmail.com>
To: dm-devel@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Subject: [dm-devel] Unused functions in dm-thin-metadata
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============5862764533587911920=="

--===============5862764533587911920==
Content-Type: multipart/alternative; boundary="000000000000a525b705a293fb68"

--000000000000a525b705a293fb68
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Not super important, but both dm_thin_remove_block and __remove are unused.
I'm assuming this is because at some point the remove_range logic was
implemented.

--000000000000a525b705a293fb68
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Not super important, but both=C2=A0dm_thin_remove_block an=
d=C2=A0__remove are unused. I&#39;m assuming this is because at some point =
the remove_range logic was implemented.</div>

--000000000000a525b705a293fb68--

--===============5862764533587911920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============5862764533587911920==--

