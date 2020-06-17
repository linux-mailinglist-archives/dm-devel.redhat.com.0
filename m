Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 047481FC761
	for <lists+dm-devel@lfdr.de>; Wed, 17 Jun 2020 09:29:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592378969;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HB2UE7rRQTYAHK11pxwpJN9LNhOqDRUYv96yABq4ut8=;
	b=VIgZSwapTOggK5uEsUiYhz8mUzGGxdb8PSqTkEHnEEdsgJInUs6tCiCM4EUjz3TR1ASW+T
	WNUEBypCzWQ+VQ9L7OvZ9nxj2/A4J9dOyaOYsz5HvYK9/YA+eOsnNky8GvOzEWBtsvTHCT
	L3npjn5fZVfu5escQNJD0QmaeZwDkcE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-23TT4RYgM0GLMfKybI8QPw-1; Wed, 17 Jun 2020 03:29:26 -0400
X-MC-Unique: 23TT4RYgM0GLMfKybI8QPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD7778735C0;
	Wed, 17 Jun 2020 07:29:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D8B15D9D3;
	Wed, 17 Jun 2020 07:29:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89A551809547;
	Wed, 17 Jun 2020 07:28:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05H7SifD008295 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 03:28:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF60F1134CD6; Wed, 17 Jun 2020 07:28:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAA7B1134CCC
	for <dm-devel@redhat.com>; Wed, 17 Jun 2020 07:28:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5FF68007B3
	for <dm-devel@redhat.com>; Wed, 17 Jun 2020 07:28:41 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-314-bOaaixnvPZyU9HS216yGRA-1;
	Wed, 17 Jun 2020 03:28:39 -0400
X-MC-Unique: bOaaixnvPZyU9HS216yGRA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id C8D66AF5B;
	Wed, 17 Jun 2020 07:28:41 +0000 (UTC)
Message-ID: <5fd1cca644c31d1ac4c6eaa951e53eeeb733413f.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Marius Bakke <marius@devup.no>, dm-devel@redhat.com
Date: Wed, 17 Jun 2020 09:28:36 +0200
In-Reply-To: <20200616231126.18538-1-marius@devup.no>
References: <d909fc0a2383f028ae7c3ad00c142193ca8d9ae7.camel@suse.com>
	<20200616231126.18538-1-marius@devup.no>
User-Agent: Evolution 3.36.3
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: Re: [dm-devel] [PATCH v2] multipath: Fix compiler warnings when
 built without systemd.
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

On Wed, 2020-06-17 at 01:11 +0200, Marius Bakke wrote:
> Add ifdef guards for code that is unused when systemd is not
> available.
> ---
>  libmultipath/config.c |  6 ++++--
>  multipathd/main.c     | 10 +++++++++-
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 

Reviewed-by: Martin Wilck <mwilck@suse.com>

Thanks!
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

