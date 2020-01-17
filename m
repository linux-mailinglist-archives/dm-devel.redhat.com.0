Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DB32C140FBB
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 18:17:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579281471;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OJdA18ekkgdw7iWZ6IJO0khdYV2dKR1qBB2H338f214=;
	b=aHnX0j8QHwIAEJKnJDOjvBEJ+zuvi5NS/BSK7wDij0CK/SRXtls7HRMiva1Y+TMLbZjXZn
	el7wS1AeIjvX5gT4KniIE71V5EcxnjwLx3x91XHORjXW7LKLBKiMaCwn7i4jN8J/SC23ky
	mMmsxxKrJUEnGsR0fumT2vbInDKu2YU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-8xnBrZcFOzq1tiKtD7KOzQ-1; Fri, 17 Jan 2020 12:17:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AF54477;
	Fri, 17 Jan 2020 17:17:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B00F60BE1;
	Fri, 17 Jan 2020 17:17:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B9A67845F8;
	Fri, 17 Jan 2020 17:17:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00HHHaEo023899 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jan 2020 12:17:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2539B10065D0; Fri, 17 Jan 2020 17:17:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E87A10065C5
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 17:17:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 107548E683F
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 17:17:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-124-xzMtXw79O5q8tn5LojOMHQ-1;
	Fri, 17 Jan 2020 12:17:32 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 472B2B2E8;
	Fri, 17 Jan 2020 17:17:30 +0000 (UTC)
Message-ID: <7b276f0772bf9aeb92d3af16e3072f717de5318e.camel@suse.de>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Fri, 17 Jan 2020 18:18:46 +0100
In-Reply-To: <1579227500-17196-12-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-12-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: xzMtXw79O5q8tn5LojOMHQ-1
X-MC-Unique: 8xnBrZcFOzq1tiKtD7KOzQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00HHHaEo023899
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 11/15] libmultipath: change failed path prio
	timeout
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

On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> multipath will try to get the priority from a PATH_DOWN path, if the
> path doesn't currently have a valid priority. However, if the
> priority
> code needs to contact the device to get the priority, this is likely
> to
> fail for PATH_DOWN paths.  This code dates back to when multipathd
> could
> not easily reload device tables with failed paths, so getting the
> correct priority was important to have a correctly configured device.
> Now multipathd can simply reload the device to move the path to the
> correct pathgroup when the path comes back up.  Since there are a
> number
> of prioritizers that don't require talking to the device, multipath
> shouldn't completely skip attempting to get the priority of these
> paths,
> but it should set a small timeout, so that it isn't hanging in the
> case where it needs to contact a device through a failed path.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/discovery.c | 14 ++++++--------
>  libmultipath/prio.c      |  2 +-
>  2 files changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> index 1ab093f4..2c331db8 100644
> --- a/libmultipath/discovery.c
> +++ b/libmultipath/discovery.c
> @@ -1661,11 +1661,10 @@ get_state (struct path * pp, struct config
> *conf, int daemon, int oldstate)
>  }
>  
>  static int
> -get_prio (struct path * pp)
> +get_prio (struct path * pp, int timeout)
>  {
>  	struct prio * p;
>  	struct config *conf;
> -	int checker_timeout;
>  	int old_prio;
>  
>  	if (!pp)
> @@ -1684,11 +1683,8 @@ get_prio (struct path * pp)
>  			return 1;
>  		}
>  	}
> -	conf = get_multipath_config();
> -	checker_timeout = conf->checker_timeout;
> -	put_multipath_config(conf);
>  	old_prio = pp->priority;
> -	pp->priority = prio_getprio(p, pp, checker_timeout);
> +	pp->priority = prio_getprio(p, pp, timeout);
>  	if (pp->priority < 0) {
>  		/* this changes pp->offline, but why not */
>  		int state = path_offline(pp);
> @@ -2095,11 +2091,13 @@ int pathinfo(struct path *pp, struct config
> *conf, int mask)
>  
>  	 /*
>  	  * Retrieve path priority, even for PATH_DOWN paths if it has
> never
> -	  * been successfully obtained before.
> +	  * been successfully obtained before. If path is down don't
> try
> +	  * for too long.
>  	  */
>  	if ((mask & DI_PRIO) && path_state == PATH_UP && strlen(pp-
> >wwid)) {
>  		if (pp->state != PATH_DOWN || pp->priority ==
> PRIO_UNDEF) {
> -			get_prio(pp);
> +			get_prio(pp, (pp->state != PATH_DOWN)?
> +				     (conf->checker_timeout * 1000) :
> 10);
>  		}
>  	}
>  
> diff --git a/libmultipath/prio.c b/libmultipath/prio.c
> index 87de1f97..21c1b092 100644
> --- a/libmultipath/prio.c
> +++ b/libmultipath/prio.c
> @@ -14,7 +14,7 @@ unsigned int get_prio_timeout(unsigned int
> checker_timeout,
>  			      unsigned int default_timeout)
>  {
>  	if (checker_timeout)
> -		return checker_timeout * 1000;
> +		return checker_timeout;
>  	return default_timeout;
>  }
> 

This changes the unit of the first get_prio_timeout() argument from
seconds to milliseconds. While that's a good thing (it was questionable
design to have the same function take several "timeout" arguments in
different units), we should rename the argument there to avoid
confusion (checker_timeout's unit is seconds all around).

Apart from that, ACK.



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

