Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2B05C2930C9
	for <lists+dm-devel@lfdr.de>; Mon, 19 Oct 2020 23:52:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603144349;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lQF9DFTKn7ajHA/mm1lPIOR92MnfiRBXlEK3mEZSbV0=;
	b=h+od0U8BAbJyF3NNC0SaKPl0qMVL+faZEAw9cG69RT9Ae8LfKzyEQX1VVsdcNv9DBATfZ2
	MEaClnWz1kVAqCDmlwsfQOspIpZ4ZmbqCKU8sDWfCmWkONUzLHaRQcqnFTwLXI7Y1Kmrub
	nd5N3YdSFNxujv9Mwo6FX1Te4In0ayI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-CHOgx7ljPbODNm2VoAOQuA-1; Mon, 19 Oct 2020 17:52:26 -0400
X-MC-Unique: CHOgx7ljPbODNm2VoAOQuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57B398064BA;
	Mon, 19 Oct 2020 21:52:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E03C46EF59;
	Mon, 19 Oct 2020 21:52:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A8C6C44A74;
	Mon, 19 Oct 2020 21:52:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09JLpuVe007140 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 17:51:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 24CED10002A4; Mon, 19 Oct 2020 21:51:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2803C1002388;
	Mon, 19 Oct 2020 21:51:53 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 09JLppqu014503; 
	Mon, 19 Oct 2020 16:51:51 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 09JLppUg014502;
	Mon, 19 Oct 2020 16:51:51 -0500
Date: Mon, 19 Oct 2020 16:51:51 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20201019215151.GI3384@octiron.msp.redhat.com>
References: <20201016104501.8700-1-mwilck@suse.com>
	<20201016104501.8700-28-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201016104501.8700-28-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 27/29] multipathd: common code for "-k"
 and command args
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 16, 2020 at 12:44:59PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> 'multipathd -k"cmd"' and 'multipath cmd' are the same thing.
> Treat it with common code.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/main.c | 37 +++++++++++++++++++------------------
>  1 file changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 725a10b..0cf8a26 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -3303,6 +3303,8 @@ main (int argc, char *argv[])
>  	int err;
>  	int foreground = 0;
>  	struct config *conf;
> +	char *opt_k_arg = NULL;
> +	bool opt_k = false;
>  
>  	ANNOTATE_BENIGN_RACE_SIZED(&multipath_conf, sizeof(multipath_conf),
>  				   "Manipulated through RCU");
> @@ -3350,16 +3352,9 @@ main (int argc, char *argv[])
>  			logsink = LOGSINK_STDERR_WITHOUT_TIME;
>  			break;
>  		case 'k':
> -			logsink = 0;
> -			conf = load_config(DEFAULT_CONFIGFILE);
> -			if (!conf)
> -				exit(1);
> -			if (verbosity)
> -				libmp_verbosity = verbosity;
> -			uxsock_timeout = conf->uxsock_timeout;
> -			err = uxclnt(optarg, uxsock_timeout + 100);
> -			free_config(conf);
> -			return err;
> +			opt_k = true;
> +			opt_k_arg = optarg;
> +			break;
>  		case 'B':
>  			bindings_read_only = 1;
>  			break;
> @@ -3375,7 +3370,7 @@ main (int argc, char *argv[])
>  			exit(1);
>  		}
>  	}
> -	if (optind < argc) {
> +	if (opt_k || optind < argc) {
>  		char cmd[CMDSIZE];
>  		char * s = cmd;
>  		char * c = s;
> @@ -3390,14 +3385,20 @@ main (int argc, char *argv[])
>  			libmp_verbosity = verbosity;
>  		uxsock_timeout = conf->uxsock_timeout;
>  		memset(cmd, 0x0, CMDSIZE);
> -		while (optind < argc) {
> -			if (strchr(argv[optind], ' '))
> -				c += snprintf(c, s + CMDSIZE - c, "\"%s\" ", argv[optind]);
> -			else
> -				c += snprintf(c, s + CMDSIZE - c, "%s ", argv[optind]);
> -			optind++;
> +		if (opt_k)
> +			s = opt_k_arg;
> +		else {
> +			while (optind < argc) {
> +				if (strchr(argv[optind], ' '))
> +					c += snprintf(c, s + CMDSIZE - c,
> +						      "\"%s\" ", argv[optind]);
> +				else
> +					c += snprintf(c, s + CMDSIZE - c,
> +						      "%s ", argv[optind]);
> +				optind++;
> +			}
> +			c += snprintf(c, s + CMDSIZE - c, "\n");

combining these two methods makes is obvious that adding the newline to
the cmd buffer is unnecessary. But since your patch didn't add it, and
it doesn't hurt anything
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

>  		}
> -		c += snprintf(c, s + CMDSIZE - c, "\n");
>  		err = uxclnt(s, uxsock_timeout + 100);
>  		free_config(conf);
>  		return err;
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

