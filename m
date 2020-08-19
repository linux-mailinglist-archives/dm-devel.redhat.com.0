Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B22B224A8F5
	for <lists+dm-devel@lfdr.de>; Thu, 20 Aug 2020 00:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597875411;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FR45GrN89Z42CCm6XrR10SHQ8cW4HjBI89Iw0lpM3KU=;
	b=LKUNu1n/9o8eL5uJY2f/Gv+lVY0SW62xibnhCF/iUx72RvjmNgSU4oKcYwJ+CbVhqthykj
	NIoIl6AniSiI8ZJ27lWhRp+JW1HAuSEY7fqohjT0RyVTfkD/GYXUMZeyYNnC1YxG0IPF09
	ivXuiMXW5gpUXqumWsFqr/j4xt85NKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-Z2GS5BxGPpKBAVJQYIZ3og-1; Wed, 19 Aug 2020 18:16:47 -0400
X-MC-Unique: Z2GS5BxGPpKBAVJQYIZ3og-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF8AC8030A7;
	Wed, 19 Aug 2020 22:16:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2E957B90C;
	Wed, 19 Aug 2020 22:16:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5824D60370;
	Wed, 19 Aug 2020 22:16:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07JMGc5o018341 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 18:16:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 18BF67C0B3; Wed, 19 Aug 2020 22:16:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F2B269C9D;
	Wed, 19 Aug 2020 22:16:35 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07JMGXw0007131; 
	Wed, 19 Aug 2020 17:16:34 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07JMGX7K007130;
	Wed, 19 Aug 2020 17:16:33 -0500
Date: Wed, 19 Aug 2020 17:16:33 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200819221633.GV19233@octiron.msp.redhat.com>
References: <20200819131819.13493-1-mwilck@suse.com>
	<20200819131819.13493-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200819131819.13493-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v3 85/87] libmultipath: alias.c: use
 strtok_r() instead of strtok()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 19, 2020 at 03:18:17PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> ... for thread-safety.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Suggested-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/alias.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/libmultipath/alias.c b/libmultipath/alias.c
> index df44bdc..de28f25 100644
> --- a/libmultipath/alias.c
> +++ b/libmultipath/alias.c
> @@ -141,14 +141,14 @@ lookup_binding(FILE *f, const char *map_wwid, char **map_alias,
>  	rewind(f);
>  	while (fgets(buf, LINE_MAX, f)) {
>  		const char *alias, *wwid;
> -		char *c;
> +		char *c, *saveptr;
>  		int curr_id;
>  
>  		line_nr++;
>  		c = strpbrk(buf, "#\n\r");
>  		if (c)
>  			*c = '\0';
> -		alias = strtok(buf, " \t");
> +		alias = strtok_r(buf, " \t", &saveptr);
>  		if (!alias) /* blank line */
>  			continue;
>  		curr_id = scan_devname(alias, prefix);
> @@ -164,7 +164,7 @@ lookup_binding(FILE *f, const char *map_wwid, char **map_alias,
>  			biggest_id = curr_id;
>  		if (curr_id > id && curr_id < smallest_bigger_id)
>  			smallest_bigger_id = curr_id;
> -		wwid = strtok(NULL, " \t");
> +		wwid = strtok_r(NULL, " \t", &saveptr);
>  		if (!wwid){
>  			condlog(3,
>  				"Ignoring malformed line %u in bindings file",
> @@ -206,17 +206,17 @@ rlookup_binding(FILE *f, char *buff, const char *map_alias)
>  	buff[0] = '\0';
>  
>  	while (fgets(line, LINE_MAX, f)) {
> -		char *c;
> +		char *c, *saveptr;
>  		const char *alias, *wwid;
>  
>  		line_nr++;
>  		c = strpbrk(line, "#\n\r");
>  		if (c)
>  			*c = '\0';
> -		alias = strtok(line, " \t");
> +		alias = strtok_r(line, " \t", &saveptr);
>  		if (!alias) /* blank line */
>  			continue;
> -		wwid = strtok(NULL, " \t");
> +		wwid = strtok_r(NULL, " \t", &saveptr);
>  		if (!wwid){
>  			condlog(3,
>  				"Ignoring malformed line %u in bindings file",
> @@ -582,23 +582,23 @@ static int _check_bindings_file(const struct config *conf, FILE *file,
>  
>  	pthread_cleanup_push(free, line);
>  	while ((n = getline(&line, &line_len, file)) >= 0) {
> -		char *c, *alias, *wwid;
> +		char *c, *alias, *wwid, *saveptr;
>  		const char *mpe_wwid;
>  
>  		linenr++;
>  		c = strpbrk(line, "#\n\r");
>  		if (c)
>  			*c = '\0';
> -		alias = strtok(line, " \t");
> +		alias = strtok_r(line, " \t", &saveptr);
>  		if (!alias) /* blank line */
>  			continue;
> -		wwid = strtok(NULL, " \t");
> +		wwid = strtok_r(NULL, " \t", &saveptr);
>  		if (!wwid) {
>  			condlog(1, "invalid line %d in bindings file, missing WWID",
>  				linenr);
>  			continue;
>  		}
> -		c = strtok(NULL, " \t");
> +		c = strtok_r(NULL, " \t", &saveptr);
>  		if (c)
>  			/* This is non-fatal */
>  			condlog(1, "invalid line %d in bindings file, extra args \"%s\"",
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

