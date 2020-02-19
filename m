Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 99CF8164099
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 10:41:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582105311;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+NrXz6qRiTs6zSkk8GTd0QbzuDbzoHHqeiSzjtbDp2M=;
	b=aSYRXw9Bt8OZImgjQk8j4RFJjYIUFBb+BlMU+GcSiMNKxSpg4a4Euezx53g9hVi01Naf1W
	4HHoCo0LF4ry9X0HPKZg0BFroFqECUXzHc0pwFi8FzvmmKD2PamFnNhI9hXdCkcY8W5J7S
	Z1XlHp0XC0sDWkxMGf/vZeL1WW7WnyQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-_GoWBeGGMFyQ0j-F_Wwt3Q-1; Wed, 19 Feb 2020 04:41:49 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58332101FC73;
	Wed, 19 Feb 2020 09:41:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14FD390064;
	Wed, 19 Feb 2020 09:41:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57E9235B16;
	Wed, 19 Feb 2020 09:41:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J9fPD0027439 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 04:41:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5C86C10AF9D8; Wed, 19 Feb 2020 09:41:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57AF010AF9D9
	for <dm-devel@redhat.com>; Wed, 19 Feb 2020 09:41:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E6A48028A6
	for <dm-devel@redhat.com>; Wed, 19 Feb 2020 09:41:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-133-HG1akcDKOD2A6Xwni2lTqg-1;
	Wed, 19 Feb 2020 04:41:18 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 51E9EB303;
	Wed, 19 Feb 2020 09:41:16 +0000 (UTC)
Message-ID: <f7fff14fca415c19b2a9309155df4bc6b95c59a9.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 10:42:50 +0100
In-Reply-To: <1582095273-10279-4-git-send-email-bmarzins@redhat.com>
References: <1582095273-10279-1-git-send-email-bmarzins@redhat.com>
	<1582095273-10279-4-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: HG1akcDKOD2A6Xwni2lTqg-1
X-MC-Unique: _GoWBeGGMFyQ0j-F_Wwt3Q-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J9fPD0027439
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/5] libmultipath: change loading and
 resetting in directio
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-02-19 at 00:54 -0600, Benjamin Marzinski wrote:
> The directio checker previously made sure to always keep an aio_group
> around after loading or resetting the checker. There is no need to do
> this, and removing this code simplifies the checker.  With this
> change,
> there is no longer a need for a load or unload checker function, only
> a
> reset function which is run when the checker is reset or unloaded.
> Changing this broke a number of tests, so the unit tests have been
> updated as well.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/checkers.c          |  26 ++---
>  libmultipath/checkers.h          |   2 +-
>  libmultipath/checkers/directio.c |  43 +-------
>  tests/directio.c                 | 177 +++++++++++++--------------
> ----
>  4 files changed, 81 insertions(+), 167 deletions(-)

Many thanks for making this change. I feared that the directio tests
were tied quite closely to implementation details...

Reviewed-by: Martin Wilck <mwilck@suse.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

