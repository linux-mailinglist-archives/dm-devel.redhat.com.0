Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F261BADC
	for <lists+dm-devel@lfdr.de>; Mon, 13 May 2019 18:19:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 11B1D3082208;
	Mon, 13 May 2019 16:19:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E850E619BC;
	Mon, 13 May 2019 16:19:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7AB8A41F58;
	Mon, 13 May 2019 16:18:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4DGIdCW024068 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 May 2019 12:18:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B290C4276; Mon, 13 May 2019 16:18:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC88063BA0
	for <dm-devel@redhat.com>; Mon, 13 May 2019 16:18:37 +0000 (UTC)
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A06113092663
	for <dm-devel@redhat.com>; Mon, 13 May 2019 16:18:36 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id e2so8375771vsc.13
	for <dm-devel@redhat.com>; Mon, 13 May 2019 09:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=L3LU3ww7WrkzHMtYsuuf2zQt4k+sdxI7TqmkMgaJQWU=;
	b=G5ldiDESrOvAWWdLZwcE9A08+emS6Z8k1ss9348TCBOVWo0b+kvZ33MIL8uwQFrWvB
	NQBx7bOD2QELaIzDyc8VnPKPk1lg5TsWLykqG6uOl/t2SD8cBr3w5RgoO8CN0li4eUrc
	K4lKdveXJgH9wFsSlk11ljnT2LZTAuYXihltQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=L3LU3ww7WrkzHMtYsuuf2zQt4k+sdxI7TqmkMgaJQWU=;
	b=dNgLAspqNo1FlvjU2nr2mOrQngYLPA3WofCKTQf0O+Pt1NkjTgqV2PE+hPTH8ie2ZB
	LXy4tj1EJB6kT4EN2KpGizNKQNPyWw66aR2SVoKYjBkbnG9fzScbZ8MabsfIzfeIuhgE
	lkTjdatyo7P6yIaYztp+NC9IN0V41KcosRgDwOu73hu69Cha0SZ7lzWrkOiVhuc1Xa1k
	xwDYn6nrWpDbrlEBT++D39WqSn8IlHEOyEEZai/bkbm0aSlE0Zga+fdIXmxvYettZiUr
	RBdpshoGtfGdKOizb0AxFzfkR3IrPJx79eeHUo6mSDNV+QSWPsxlJMpGn4y9+DVP62WS
	Pe/w==
X-Gm-Message-State: APjAAAVUYsbiTpkbeFxzh5Ap90CFy0+wyWwcOEhxd68ogKdAlCuiqsMM
	hLs1Ub8aDcAPMT1GUFKMRlWq7+TqJeA=
X-Google-Smtp-Source: APXvYqw/kP5CLl+7/mS5o/zE/mB+s9c+N4+02wXOsDqM3JJccU/fTvZlWNMlU/iAmhPrYr/d5R/F0A==
X-Received: by 2002:a67:c109:: with SMTP id d9mr5566168vsj.172.1557764315416; 
	Mon, 13 May 2019 09:18:35 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
	[209.85.222.52]) by smtp.gmail.com with ESMTPSA id
	g135sm4826577vke.53.2019.05.13.09.18.34 for <dm-devel@redhat.com>
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 May 2019 09:18:34 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id u4so1579506uau.10
	for <dm-devel@redhat.com>; Mon, 13 May 2019 09:18:34 -0700 (PDT)
X-Received: by 2002:ab0:2709:: with SMTP id s9mr13325214uao.21.1557764314196; 
	Mon, 13 May 2019 09:18:34 -0700 (PDT)
MIME-Version: 1.0
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 May 2019 09:18:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VOAjgdrvkK8YKPP-8zqwPpo39rA43JH2BCeYLB0UkgAQ@mail.gmail.com>
Message-ID: <CAD=FV=VOAjgdrvkK8YKPP-8zqwPpo39rA43JH2BCeYLB0UkgAQ@mail.gmail.com>
To: Tim Murray <timmurray@google.com>, Mike Snitzer <snitzer@redhat.com>,
	Guenter Roeck <groeck@chromium.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 13 May 2019 16:18:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Mon, 13 May 2019 16:18:36 +0000 (UTC) for IP:'209.85.217.67'
	DOMAIN:'mail-vs1-f67.google.com' HELO:'mail-vs1-f67.google.com'
	FROM:'dianders@chromium.org' RCPT:''
X-RedHat-Spam-Score: -0.113  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_PASS) 209.85.217.67 mail-vs1-f67.google.com 209.85.217.67
	mail-vs1-f67.google.com <dianders@chromium.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Vito Caputo <vcaputo@pengaru.com>, dm-devel@redhat.com,
	LKML <linux-kernel@vger.kernel.org>
Subject: [dm-devel] Problems caused by dm crypt: use WQ_HIGHPRI for the IO
	and crypt workqueues
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 13 May 2019 16:19:18 +0000 (UTC)

Hi,

I wanted to jump on the bandwagon of people reporting problems with
commit a1b89132dc4f ("dm crypt: use WQ_HIGHPRI for the IO and crypt
workqueues").

Specifically I've been tracking down communication errors when talking
to our Embedded Controller (EC) over SPI.  I found that communication
errors happened _much_ more frequently on newer kernels than older
ones.  Using ftrace I managed to track the problem down to the dm
crypt patch.  ...and, indeed, reverting that patch gets rid of the
vast majority of my errors.

If you want to see the ftrace of my high priority worker getting
blocked for 7.5 ms, you can see:

https://bugs.chromium.org/p/chromium/issues/attachmentText?aid=392715


In my case I'm looking at solving my problems by bumping the CrOS EC
transfers fully up to real time priority.  ...but given that there are
other reports of problems with the dm-crypt priority (notably I found
https://bugzilla.kernel.org/show_bug.cgi?id=199857) maybe we should
also come up with a different solution for dm-crypt?


Thanks!

-Doug

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
