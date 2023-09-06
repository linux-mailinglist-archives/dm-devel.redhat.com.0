Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1231079466E
	for <lists+dm-devel@lfdr.de>; Thu,  7 Sep 2023 00:44:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694040284;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=23DddMr++mBlqO6RAUkxAYDr3GUbMCDylymjXEqpHnk=;
	b=CtPPGmyS2U+UIbbBuR3pEHu3k4dnHfOsuv/R8HExcX+tOVL0n2e2ioqDgqnO5MdYVaeMuA
	/EsnPRlxe4x6FGZcB3a6LXw161JzTMv/hf/FAQPqVh6rkdHGG5TnGGseDecmOS+fTRqSnj
	zwJm6IOB1mKlZEUH0VMjvXj1KmVSdqs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-9JXumBtfOUOhKq4Ka5luDw-1; Wed, 06 Sep 2023 18:44:41 -0400
X-MC-Unique: 9JXumBtfOUOhKq4Ka5luDw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5231210264F3;
	Wed,  6 Sep 2023 22:44:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D3CB4493112;
	Wed,  6 Sep 2023 22:44:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EF3B419465B3;
	Wed,  6 Sep 2023 22:44:37 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 66089194658C
 for <dm-devel@listman.corp.redhat.com>; Wed,  6 Sep 2023 22:44:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 59B08140E963; Wed,  6 Sep 2023 22:44:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42351140E950;
 Wed,  6 Sep 2023 22:44:37 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 386MiTB0028960;
 Wed, 6 Sep 2023 17:44:29 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 386MiSiS028959;
 Wed, 6 Sep 2023 17:44:28 -0500
Date: Wed, 6 Sep 2023 17:44:28 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20230906224428.GV7412@octiron.msp.redhat.com>
References: <20230901180235.23980-1-mwilck@suse.com>
 <20230901180235.23980-12-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20230901180235.23980-12-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [dm-devel] [PATCH 11/21] libmultipath: add global variable for
 current bindings
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 01, 2023 at 08:02:24PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Add a variable global_bindings that holds the currently active vector of
> bindings. This variable is freed at program exit.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/alias.c              | 11 +++++++++--
>  libmultipath/alias.h              |  1 +
>  libmultipath/libmultipath.version |  1 +
>  multipath/main.c                  |  2 ++
>  multipathd/main.c                 |  1 +
>  5 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/libmultipath/alias.c b/libmultipath/alias.c
> index e61eb91..0759643 100644
> --- a/libmultipath/alias.c
> +++ b/libmultipath/alias.c
> @@ -522,6 +522,7 @@ static void _free_binding(struct binding *bdg)
>   * an abstract type.
>   */
>  typedef struct _vector Bindings;
> +static Bindings global_bindings = { .allocated = 0 };
>  
>  static void free_bindings(Bindings *bindings)
>  {
> @@ -533,6 +534,11 @@ static void free_bindings(Bindings *bindings)
>  	vector_reset(bindings);
>  }
>  
> +void cleanup_bindings(void)
> +{
> +	free_bindings(&global_bindings);
> +}
> +
>  enum {
>  	BINDING_EXISTS,
>  	BINDING_CONFLICT,
> @@ -762,7 +768,6 @@ int check_alias_settings(const struct config *conf)
>  	pthread_cleanup_pop(1);
>  	pthread_cleanup_pop(1);
>  
> -	pthread_cleanup_push_cast(free_bindings, &bindings);
>  	fd = open_file(conf->bindings_file, &can_write, BINDINGS_FILE_HEADER);
>  	if (fd != -1) {
>  		FILE *file = fdopen(fd, "r");
> @@ -782,6 +787,8 @@ int check_alias_settings(const struct config *conf)
>  			close(fd);
>  		}
>  	}
> -	pthread_cleanup_pop(1);
> +
> +	cleanup_bindings();
> +	global_bindings = bindings;
>  	return rc;
>  }
> diff --git a/libmultipath/alias.h b/libmultipath/alias.h
> index fa33223..37b49d9 100644
> --- a/libmultipath/alias.h
> +++ b/libmultipath/alias.h
> @@ -9,5 +9,6 @@ char *get_user_friendly_alias(const char *wwid, const char *file,
>  
>  struct config;
>  int check_alias_settings(const struct config *);
> +void cleanup_bindings(void);
>  
>  #endif /* _ALIAS_H */
> diff --git a/libmultipath/libmultipath.version b/libmultipath/libmultipath.version
> index a7b8c33..ddd302f 100644
> --- a/libmultipath/libmultipath.version
> +++ b/libmultipath/libmultipath.version
> @@ -64,6 +64,7 @@ global:
>  	checker_name;
>  	checker_state_name;
>  	check_foreign;
> +	cleanup_bindings;
>  	cleanup_lock;
>  	coalesce_paths;
>  	count_active_paths;
> diff --git a/multipath/main.c b/multipath/main.c
> index b78f316..45e9745 100644
> --- a/multipath/main.c
> +++ b/multipath/main.c
> @@ -843,6 +843,8 @@ main (int argc, char *argv[])
>  	conf->force_sync = 1;
>  	if (atexit(cleanup_vecs))
>  		condlog(1, "failed to register cleanup handler for vecs: %m");
> +	if (atexit(cleanup_bindings))
> +		condlog(1, "failed to register cleanup handler for bindings: %m");
>  	while ((arg = getopt(argc, argv, ":adDcChl::eFfM:v:p:b:BrR:itTquUwW")) != EOF ) {
>  		switch(arg) {
>  		case 'v':
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 2e02a54..214ed4a 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -3325,6 +3325,7 @@ static void cleanup_child(void)
>  {
>  	cleanup_threads();
>  	cleanup_vecs();
> +	cleanup_bindings();
>  	if (poll_dmevents)
>  		cleanup_dmevent_waiter();
>  
> -- 
> 2.41.0
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

