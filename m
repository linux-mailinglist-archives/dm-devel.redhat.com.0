Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E5D001640B2
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 10:45:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582105518;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iHQYC15wz4uZvJyqZHRrjbEcXoMslWjvPefTGFLFECM=;
	b=TAphTRk5ZUwtGFgMgXsz40qIUzTxRPdPTSd3WIHkDa5QqbeCrz/7quXAwns+IBCjMj3Ao3
	Ey59fbLTN+++UT7V7JgejBihsYN/xNH6xB06zDwyE+scxGp+IiIW3eHNox8Tau0tjAGfEo
	UfOK2BL8h5sfO+S4DEaTz/FZijJhEBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-T1W5CQMNOJeF_YyCnPDCQQ-1; Wed, 19 Feb 2020 04:45:16 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5B96DBB6;
	Wed, 19 Feb 2020 09:45:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B44E60BE1;
	Wed, 19 Feb 2020 09:45:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 37FF135B16;
	Wed, 19 Feb 2020 09:45:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J9j1eh027622 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 04:45:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1EC572063FE5; Wed, 19 Feb 2020 09:45:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19B8B2026D67
	for <dm-devel@redhat.com>; Wed, 19 Feb 2020 09:44:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFC01803881
	for <dm-devel@redhat.com>; Wed, 19 Feb 2020 09:44:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-426-t6RxQwnYNE-BIqkxMCCE0A-1;
	Wed, 19 Feb 2020 04:44:55 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 8FC7DAD3C;
	Wed, 19 Feb 2020 09:44:53 +0000 (UTC)
Message-ID: <48f3cbd6e31c4f2fccfa572c1a73c8be13674488.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 10:46:28 +0100
In-Reply-To: <1582095273-10279-5-git-send-email-bmarzins@redhat.com>
References: <1582095273-10279-1-git-send-email-bmarzins@redhat.com>
	<1582095273-10279-5-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: t6RxQwnYNE-BIqkxMCCE0A-1
X-MC-Unique: T1W5CQMNOJeF_YyCnPDCQQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J9j1eh027622
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/5] libmultipath: change directio
 get_events() timeout handling
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
> get_events() used a NULL or a zeroed timeout to mean "don't wait".
> io_getevents() uses a NULL timeout to mean "wait forever" and a
> zeroed timeout to mean "don't wait". Make get_events() work like
> io_getevents().
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/checkers/directio.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Thank you.

Reviewed-by: Martin Wilck <mwilck@suse.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

