Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id BCA221A10C4
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 17:56:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586274985;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C83ovY5oNbCsrvj34Zk2vtOQOHcoWgb+rYPMr7JwQ28=;
	b=GNRHHBXA/lQ/ap9frN+q+OBiOFi8ZnN2QJkIqjcDsfwmLupD2SGr3PXX3YX7hEf0y0v1PB
	wZmKMW66e4PIX+Vh3p752zuB1Go/+E8x9HQ0GdYkwf6437eg2K7pmql2sJhkzW3XtL5WFg
	ztfEtulBIYpjl7t5hXwrPXcW0B1e8Aw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-OVB3QV-oO_eiFpxHi-IG-A-1; Tue, 07 Apr 2020 11:56:21 -0400
X-MC-Unique: OVB3QV-oO_eiFpxHi-IG-A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CDC88018A5;
	Tue,  7 Apr 2020 15:56:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B529F60BEC;
	Tue,  7 Apr 2020 15:56:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F41D793A62;
	Tue,  7 Apr 2020 15:56:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 037Ftu60026824 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Apr 2020 11:55:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3817610D14FF; Tue,  7 Apr 2020 15:55:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3460A10D18F4
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 15:55:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD277800297
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 15:55:53 +0000 (UTC)
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-30-ajILUTLvPbuqq3bOdB91vg-1; Tue, 07 Apr 2020 11:55:51 -0400
X-MC-Unique: ajILUTLvPbuqq3bOdB91vg-1
Received: by mail-vk1-f196.google.com with SMTP id s194so934320vkb.11
	for <dm-devel@redhat.com>; Tue, 07 Apr 2020 08:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eg1oxRZLpZlWPD6oCz4X837FCVZ7vE34GRCOngbw0dI=;
	b=qY28P3UPwRe4LORtq0NNyFsoDqiawF6FyrCtDuWf4Jn4lqmluUcoNQaAxNPJIBnjFs
	9RQCTN9+2jUwBBG9D2eY4OXEJd7SK6vdmelKaQ59D5FyXAMVeK5sclWnw6prgdEBTagG
	5Ef8fclvYmcLXB7qE/AAeehddZiD4cZFP/xXBUUzp6z73nVVVegDp3VVKmlnvGw746OU
	hHXg1Hv2xBiA8YFpgUELok4+wMNgRRWKwQ2zT89Nspdm4A/aErgB6Hoombc0GKRwStBy
	x3BKM1fSJrwT2o/+oFZlvdj2VRrG8Bi0yipYqKHHSBtG8Ki2Nwj/searNAw8agBTjDQT
	h6Yw==
X-Gm-Message-State: AGi0PubXk3Lp5op4YcOR9TMUurwKsMs++3sXtdINaCEr6rZnI7ok8WIa
	LNu11Xii/BjSVm5XvW1w+KAcu7G7pYRCIDdqUGMoJw==
X-Google-Smtp-Source: APiQypKH+9UUCOpR6lr3lTe5bFEuhXdjiFsvZ1RD0SdxgH1Lkoi+J8EUw9FluJiLwN7u75DMXQQF1nqanfUpe8WgUyw=
X-Received: by 2002:a1f:5003:: with SMTP id e3mr1933649vkb.59.1586274950469;
	Tue, 07 Apr 2020 08:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200407065340epcas1p13e6e5ad6131f0a94d3ed1e8360353a82@epcas1p1.samsung.com>
	<317e0073-a6f7-4232-3b95-a4bc3ddbcdec@samsung.com>
In-Reply-To: <317e0073-a6f7-4232-3b95-a4bc3ddbcdec@samsung.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 7 Apr 2020 08:55:39 -0700
Message-ID: <CABCJKudWRmdyJAxjnTs+NiRJVnhDUQfzGO3sVKZNJoQ5Qi-aew@mail.gmail.com>
To: Sunwook Eom <speed.eom@samsung.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 037Ftu60026824
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 6, 2020 at 11:54 PM Sunwook Eom <speed.eom@samsung.com> wrote:
>
> Even if block type is metadata,
> block in verity_fec_decode() has already the right block number.
> So there is no need to add data_blocks to block.

Is this also true if the hashes are on a separate block device?

The idea here is that the error correction data was computed over both
data and hash blocks, as if they were concatenated, and we want to
calculate the logical block number based on that. I agree that the
code doesn't look quite right though. Should we use something like
this instead?

    if (type == DM_VERITY_BLOCK_TYPE_METADATA)
            block = block - v->hash_start + v->data_blocks;

Sami


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

