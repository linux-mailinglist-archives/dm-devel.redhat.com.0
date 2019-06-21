Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5FC4EF5C
	for <lists+dm-devel@lfdr.de>; Fri, 21 Jun 2019 21:25:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6AE659451;
	Fri, 21 Jun 2019 19:24:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3703E1001B27;
	Fri, 21 Jun 2019 19:24:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBB8C1806B1A;
	Fri, 21 Jun 2019 19:24:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5LJNGQX026407 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Jun 2019 15:23:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F176C5DA5B; Fri, 21 Jun 2019 19:23:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CA655D9E2;
	Fri, 21 Jun 2019 19:23:10 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x5LJN8D7006700; 
	Fri, 21 Jun 2019 14:23:08 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x5LJN7Oq006699;
	Fri, 21 Jun 2019 14:23:07 -0500
Date: Fri, 21 Jun 2019 14:23:07 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20190621192307.GL3251@octiron.msp.redhat.com>
References: <20190607130552.13203-1-mwilck@suse.com>
	<20190607130552.13203-8-mwilck@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190607130552.13203-8-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 07/30] libmpathcmd: use target length in
	strncpy() call
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Fri, 21 Jun 2019 19:25:01 +0000 (UTC)

On Fri, Jun 07, 2019 at 03:05:29PM +0200, Martin Wilck wrote:

Not a big deal since default socket is a defined string, but since we
are writing to &addr.sun_path[1], if DEFAULT_SOCKET were of size >=
"sizeof(addr.sun_path) - 1", the strncpy() would fill all of
addr.sun_path, without leaving any space for the the null byte at the
end. I assume you meant to change this to be strlcpy() instead of
leaving it as strncpy().

-Ben

> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmpathcmd/mpath_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libmpathcmd/mpath_cmd.c b/libmpathcmd/mpath_cmd.c
> index b681311b..05b69316 100644
> --- a/libmpathcmd/mpath_cmd.c
> +++ b/libmpathcmd/mpath_cmd.c
> @@ -104,7 +104,7 @@ int __mpath_connect(int nonblocking)
>  	addr.sun_family = AF_LOCAL;
>  	addr.sun_path[0] = '\0';
>  	len = strlen(DEFAULT_SOCKET) + 1 + sizeof(sa_family_t);
> -	strncpy(&addr.sun_path[1], DEFAULT_SOCKET, len);
> +	strncpy(&addr.sun_path[1], DEFAULT_SOCKET, sizeof(addr.sun_path) - 1);
>  
>  	fd = socket(AF_LOCAL, SOCK_STREAM, 0);
>  	if (fd == -1)
> -- 
> 2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
