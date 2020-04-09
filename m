Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 42CB01A3C70
	for <lists+dm-devel@lfdr.de>; Fri, 10 Apr 2020 00:35:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586471738;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yt0IjITip09eC3GMKw5FW84LCihCVYBQhUSX42DhS24=;
	b=UfAhqtgto7SbwQK1y9vQFavgP7ugM/WexfXVlM+QhUw9AmbF3zCDEE6CoqPUlXeXdLCVlE
	TaOnTk+nZvZdxWVWqS2zijGQ64oRy8o/2H9eCh5NRPjVF2hYlicczcixgTV8qsn/oNmCP1
	ZOQ06VXxR6Wlo5vUrVvJh1+aFYzz8I4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-OaNK9WYSPQ6zl9HkK3cVCg-1; Thu, 09 Apr 2020 18:35:33 -0400
X-MC-Unique: OaNK9WYSPQ6zl9HkK3cVCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 668C8DBA5;
	Thu,  9 Apr 2020 22:35:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B6495DA76;
	Thu,  9 Apr 2020 22:35:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0EDAE93062;
	Thu,  9 Apr 2020 22:35:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 039MYwQ1032691 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Apr 2020 18:34:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B2F212166B39; Thu,  9 Apr 2020 22:34:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE3492166B37
	for <dm-devel@redhat.com>; Thu,  9 Apr 2020 22:34:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5705E800295
	for <dm-devel@redhat.com>; Thu,  9 Apr 2020 22:34:56 +0000 (UTC)
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-363-DizhsixwNtW5TaHgPt3AZg-1; Thu, 09 Apr 2020 18:34:54 -0400
X-MC-Unique: DizhsixwNtW5TaHgPt3AZg-1
Received: by mail-vk1-f196.google.com with SMTP id n128so143071vke.5
	for <dm-devel@redhat.com>; Thu, 09 Apr 2020 15:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O43YyhQbXypQigpDb5W4AE3UQtabqP/VhiwIcpxo7xc=;
	b=Qx+hPWefJsW4Jq2shjxLeqqIYHbbStmS1O3e64IIV0uBCV2r+2cA9WUnKnK1BozWWn
	ITrmmEdSHyhQG25eqwyD8Y9IP+ZEIVweSuQ+LOJUqZOlJkNxEwUQV52IpizYeOru8FrI
	ob/FB9N/HeSzNnkygMKd8BMl8MZvkThiTnlHRbtmj7jVPQkKuF4SqpsQ43MPSek+JKq9
	aEHYTbWqbilBCJakNu2jrqw6YQsO6ytcWLfuvivBBPORU6U13giu1xe1qzUK8uPDzn7h
	EIaA8MgLeA7vMcUaH+Xf+FtvQjCIAzj3Mgd3QO/W2QIlI/YXE4INpCtw+ERKgx9NDs2I
	tsOw==
X-Gm-Message-State: AGi0PuavPE7W+eJZGxACwQoDWRZc6oMYHXLl3/dfDmBw3qW4UfLLzP6i
	iKMiJDCrjaXq80EMynDWAb0anNnIXing8mV0hIFDHg==
X-Google-Smtp-Source: APiQypJYyEmRQ3L852FLGq6kYriYYTWzejlxWdd/TgxoFOIAYYRioXQN+b5ufHFx4QzoDIychhUzl3z78Lr7elgOhFw=
X-Received: by 2002:a1f:5003:: with SMTP id e3mr1537385vkb.59.1586471693332;
	Thu, 09 Apr 2020 15:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200407065340epcas1p13e6e5ad6131f0a94d3ed1e8360353a82@epcas1p1.samsung.com>
	<317e0073-a6f7-4232-3b95-a4bc3ddbcdec@samsung.com>
	<CABCJKudWRmdyJAxjnTs+NiRJVnhDUQfzGO3sVKZNJoQ5Qi-aew@mail.gmail.com>
	<4a4a914c-c020-4b45-7cba-5aed816f0545@samsung.com>
In-Reply-To: <4a4a914c-c020-4b45-7cba-5aed816f0545@samsung.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 9 Apr 2020 15:34:41 -0700
Message-ID: <CABCJKueXaqJz2n9sfAOWsHGD8qgL8VzD5qWcqsK7cA6zrM_Yrw@mail.gmail.com>
To: Sunwook Eom <speed.eom@samsung.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 039MYwQ1032691
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>, sunwook5492@gmail.com,
	Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH] dm verity fec: Don't add data_blocks to block
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 8, 2020 at 11:40 PM Sunwook Eom <speed.eom@samsung.com> wrote:
> If you don't mind, I'll send a new version of this patch.

Sounds good, thanks! Please also add a Fixes tag to the next version:

Fixes: a739ff3f543af ("dm verity: add support for forward error correction")

Sami


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

