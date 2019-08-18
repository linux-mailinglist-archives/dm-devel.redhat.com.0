Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E881F91EFD
	for <lists+dm-devel@lfdr.de>; Mon, 19 Aug 2019 10:34:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DEE13796E6;
	Mon, 19 Aug 2019 08:34:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1C31859BA;
	Mon, 19 Aug 2019 08:34:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 472E21800202;
	Mon, 19 Aug 2019 08:34:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7IFxnpN001307 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 18 Aug 2019 11:59:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7149C1001B20; Sun, 18 Aug 2019 15:59:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx23.extmail.prod.ext.phx2.redhat.com
	[10.5.110.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E89AD1001B14;
	Sun, 18 Aug 2019 15:59:44 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B797D1089042;
	Sun, 18 Aug 2019 15:59:43 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id s49so9137967edb.1;
	Sun, 18 Aug 2019 08:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=YtQgJT4A494ui6fKTGfhBmRclNb93UrWDKY2hAFB+k0=;
	b=Y6gYv1U3OAAC3iCSlTkDucEcgde+5dSj+cWQU4xVBz20xWr1xp6L9DXeJ9mUQCkHJh
	MpAJVdafaECCC8ZhPuEBUd8titt9NTAIvw2QOkAeNJS7TcwABnE3pDOHpqUC/VIrEaZu
	FDhOMgCljVp/rcNzUYv6QAlvgr4ciMynWuzYErb2+dqZ8H3xB5gqjzmqT8BKlvly76pA
	WcqAvfYnsyKICgrQanWJutLxWDdfpjpwMZ4jL7tcjzsyq57N7YdoX5r9b69dwWd5x30p
	m3XEyM1PUyvydahmvmwweBsXuxaBgdqO4BuKGikfvA0HDD/nE75PPnrvuHLmslLvFZxS
	BY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mime-version:content-disposition:user-agent;
	bh=YtQgJT4A494ui6fKTGfhBmRclNb93UrWDKY2hAFB+k0=;
	b=YirxhbkbBASOlq0ngXv5/gu3bT9yrl66p5a4txW/3Oxuuh9Kam3OT0Ju54bubJgym5
	Z+Dc5Axv0wYWtk9l56rc58zJ6dvpPXQlOmanRSLOXnA7LREzIk/zTLkKiwkqYLmXpenf
	gG9G4AWfQgJNlHmLA8B/P1rHJgD5SV/CEP5jBt4QG2W5heUE5E3JI8+uswVIiDfS309R
	DG5x1lKMZCf1dk5XUxA2qtqOipK6Ox5ErOMb6tA1Y+QVMeFRnaWymZBVLj2W5MDBc0VQ
	3Ezcn7VP+ROoXQcQaUXi0Rs7BaW53CjWYQD224FPooRinvahHhftb+jmPeHuDDdg+3iz
	ZlOQ==
X-Gm-Message-State: APjAAAVFwsv31Ns98gZqEYpGojMwCfgFvp8vWOxVjaRQYhuDVT3WLnkS
	GlgBf7FSDFTDVpZLZjVHHHw=
X-Google-Smtp-Source: APXvYqw48WKeGICutTb+RMvs5fZM9ahepU3aXgbUsKlm8lRZy6FUoJj2ptG627uA0qJuXRZrmP8ORg==
X-Received: by 2002:a17:906:c669:: with SMTP id
	ew9mr17858117ejb.217.1566143982421; 
	Sun, 18 Aug 2019 08:59:42 -0700 (PDT)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
	by smtp.gmail.com with ESMTPSA id m23sm797415ejj.61.2019.08.18.08.59.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 18 Aug 2019 08:59:41 -0700 (PDT)
Date: Sun, 18 Aug 2019 17:59:41 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>, Mike Snitzer <snitzer@redhat.com>
Message-ID: <20190818155941.GA26766@eldamar.local>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.64]);
	Sun, 18 Aug 2019 15:59:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]);
	Sun, 18 Aug 2019 15:59:43 +0000 (UTC) for IP:'209.85.208.67'
	DOMAIN:'mail-ed1-f67.google.com' HELO:'mail-ed1-f67.google.com'
	FROM:'salvatore.bonaccorso@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.261  (DKIM_SIGNED, DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.208.67 mail-ed1-f67.google.com 209.85.208.67
	mail-ed1-f67.google.com <salvatore.bonaccorso@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.64
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 19 Aug 2019 04:33:53 -0400
Cc: dm-devel@redhat.com, Chris Hofstaedtler <zeha@debian.org>,
	Alasdair Kergon <agk@redhat.com>, stable@vger.kernel.org
Subject: [dm-devel] Backport request for bcb44433bba5 ("dm: disable DISCARD
 if the underlying storage no longer supports it")
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 19 Aug 2019 08:34:15 +0000 (UTC)

Hi

In Debian bug https://bugs.debian.org/934331 ran into issues which
match the upstream commit bcb44433bba5 ("dm: disable DISCARD if the
underlying storage no longer supports it").

This commit was CC'ed to stable, but only got applied in v5.0.8 (and
later on backported by Ben Hutchings to v3.16.72).

Mike, I have not checked how easily that would be for older stable
versions, but can the backport be considered for versions down to 4.9?
Apparently Ben did succeed with some changes needed. To 4.19 it should
apply with a small conflict in drivers/md/dm-core.h AFAICS.

Regards,
Salvatore

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
