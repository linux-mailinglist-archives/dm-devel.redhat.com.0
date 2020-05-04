Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4306E1C3B2F
	for <lists+dm-devel@lfdr.de>; Mon,  4 May 2020 15:26:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588598768;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ljX0VWj/blpMiv+QfpRFhaMjMSBI7nBFdpr811Foat0=;
	b=BjjemqIlXfdcq0nxEcowJ1IAbJpaujDV5Ae5RsIQr4L5BZwuchE75GctDEzu35kVsid2RA
	v3KTaehl/kArgvNxjJ+d2JBJJZ36uthhaFafgbaHZ4xT+FKnAT6OEioSsOCRbfVzBkWqRB
	dK8mVK60oa1l9PQILjGQpkTAtnHhy1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-PtZR7ijaMPu9ayXKzYmSAg-1; Mon, 04 May 2020 09:25:35 -0400
X-MC-Unique: PtZR7ijaMPu9ayXKzYmSAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C35871B18BC0;
	Mon,  4 May 2020 13:25:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1E6C60C87;
	Mon,  4 May 2020 13:25:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 587211809542;
	Mon,  4 May 2020 13:25:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 044DLT8A022007 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 4 May 2020 09:21:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 03B7A10F8E0C; Mon,  4 May 2020 13:21:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF1E810FD2B5
	for <dm-devel@redhat.com>; Mon,  4 May 2020 13:21:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECC08882967
	for <dm-devel@redhat.com>; Mon,  4 May 2020 13:21:26 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
	[217.70.183.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-306-B6QkegWWM1-GoNZhgcFr3w-1; Mon, 04 May 2020 09:21:23 -0400
X-MC-Unique: B6QkegWWM1-GoNZhgcFr3w-1
X-Originating-IP: 209.85.166.176
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
	[209.85.166.176]) (Authenticated sender: smtp@opensvc.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D5593C0008;
	Mon,  4 May 2020 13:21:21 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id m5so11169493ilj.10;
	Mon, 04 May 2020 06:21:21 -0700 (PDT)
X-Gm-Message-State: AGi0PualdvnlafpzNXVHhiicaP3uS6EtY9S/cVgIM5Fg7QCCX0Y6BdEw
	FlMrUIVSg5dwcGpL/UiBGVm12N9DScEL8YMKMHw=
X-Google-Smtp-Source: APiQypKAobSnoYxpi6WEiR65Xcnsa29DZCeCjvq56XrAUGFnYN9GdHudCco0LL9HCk6T94E+95egU9/MkyD3OsBoui4=
X-Received: by 2002:a92:3d85:: with SMTP id k5mr16756811ilf.26.1588598480549; 
	Mon, 04 May 2020 06:21:20 -0700 (PDT)
MIME-Version: 1.0
From: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 4 May 2020 15:21:09 +0200
X-Gmail-Original-Message-ID: <CABr-Gnd6Gv-dgO+K=hAMMF+KtBm7AATHuo5P+DVjhvTAQ+qM+w@mail.gmail.com>
Message-ID: <CABr-Gnd6Gv-dgO+K=hAMMF+KtBm7AATHuo5P+DVjhvTAQ+qM+w@mail.gmail.com>
To: device-mapper development <dm-devel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] multipath-tools 0.8.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============4977455818641468863=="

--===============4977455818641468863==
Content-Type: multipart/alternative; boundary="0000000000001fbe8c05a4d26858"

--0000000000001fbe8c05a4d26858
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi list,

the 0.8.4 version is tagged.
The backlog is merged up to Martin tests/ patchset from March 3rd
(included).

Best,
Christophe.

--0000000000001fbe8c05a4d26858
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi list,<div><br></div><div>the 0.8.4 version is tagged.</=
div><div>The backlog is merged up to Martin tests/ patchset from March 3rd =
(included).</div><div><br></div><div>Best,</div><div>Christophe.</div></div=
>

--0000000000001fbe8c05a4d26858--

--===============4977455818641468863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============4977455818641468863==--

