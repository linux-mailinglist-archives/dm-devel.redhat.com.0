Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BE7F61640C8
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 10:50:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582105804;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DzulWt1Bb9gS1pe2+sqFG425es4WyLZeFN4QCGM0zsc=;
	b=FnYj5P4jJwhlTRzp6gv8hGbVjZVuANfRrxLUX8pmO+zxgfoIsdtmrKL1lTYCYjESrG1oaJ
	UNeW0B9c8Fzt+RrrfCU6YGn1hFr/RegH+dK5KjCY8DS3BOp+85U15oSE+qsXVb+Cmvz66n
	1O7d3qpED2FktM8pfCCBWzyCdq8Jp/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-5juYUfqUNNqxkbKubAFlbw-1; Wed, 19 Feb 2020 04:50:01 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7101E107ACC5;
	Wed, 19 Feb 2020 09:49:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA4F760BE1;
	Wed, 19 Feb 2020 09:49:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D087835B16;
	Wed, 19 Feb 2020 09:49:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J9nh4j027867 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 04:49:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EBA6210AF414; Wed, 19 Feb 2020 09:49:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E749610AF413
	for <dm-devel@redhat.com>; Wed, 19 Feb 2020 09:49:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DA318EB450
	for <dm-devel@redhat.com>; Wed, 19 Feb 2020 09:49:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-233-iaupsPLOOSOkpP1w4aOs3A-1;
	Wed, 19 Feb 2020 04:49:32 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id B86DAB279;
	Wed, 19 Feb 2020 09:49:30 +0000 (UTC)
Message-ID: <83602ac4a72622a33caeace1fee0395b3212d036.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 10:51:05 +0100
In-Reply-To: <1582095273-10279-6-git-send-email-bmarzins@redhat.com>
References: <1582095273-10279-1-git-send-email-bmarzins@redhat.com>
	<1582095273-10279-6-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: iaupsPLOOSOkpP1w4aOs3A-1
X-MC-Unique: 5juYUfqUNNqxkbKubAFlbw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J9nh4j027867
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 5/5] libmultipath: cleanup old issues with
 directio checker
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

On Wed, 2020-02-19 at 00:54 -0600, Benjamin Marzinski wrote:
> The directio checker manually aligns its directio buffer, instead of
> using posix_memalign(). It also defaults the block size for the read
> to
> 512, which may be too small for 4k devices, and it only waits for 5
> ns
> for IO completion before giving up and setting the path to pending,
> which means that in will virtually always set the path to pending on
> the
> check when the IO is issued.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> 
> ---
>  libmultipath/checkers/directio.c | 13 ++++---------
>  tests/directio.c                 |  1 -
>  2 files changed, 4 insertions(+), 10 deletions(-)

Reviewed-by: Martin Wilck <mwilck@suse.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

