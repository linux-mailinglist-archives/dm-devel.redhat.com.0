Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D00BB40D295
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 06:32:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631766775;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3bGHILCaPtVYTTJ+IMSeSK7y7zvGCak4TqeHAZlc3zQ=;
	b=I6Bjm+q6XKvHfsdhwLV3js5Rjdf805AJBFICrwAmpjYKG/imtT17qbD92YplcnUF1/yAAo
	+6k3XRFpm/gb5ZVU9hMTnpAjynPqetKBQh7bqnS29Csbn3+6yPCg1UQ5rdLmPy5/7z69T5
	K2lPZhcCyRb5yUo803bdFSCKaTbJUkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-yCqsE6iLPky4ijkYRF9MYg-1; Thu, 16 Sep 2021 00:32:54 -0400
X-MC-Unique: yCqsE6iLPky4ijkYRF9MYg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD697801E72;
	Thu, 16 Sep 2021 04:32:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3E241000358;
	Thu, 16 Sep 2021 04:32:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B22814EA2A;
	Thu, 16 Sep 2021 04:32:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18G4OavU004964 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Sep 2021 00:24:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F7D25C1D1; Thu, 16 Sep 2021 04:24:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F4FD5C1A1;
	Thu, 16 Sep 2021 04:24:33 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18G4OVKn007932; 
	Wed, 15 Sep 2021 23:24:31 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18G4OVcW007931;
	Wed, 15 Sep 2021 23:24:31 -0500
Date: Wed, 15 Sep 2021 23:24:30 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210916042430.GU3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-36-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210910114120.13665-36-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 35/35] multipathd: uxclt: allow client mode
 for non-root, too
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 10, 2021 at 01:41:20PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> The server checks for root permissions anyway. "multipathd -k"
> should work for ordinary users as long as no priviledged commands
> are executed.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/main.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/multipathd/main.c b/multipathd/main.c
> index ec4bcc3..ff5b600 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -3329,11 +3329,6 @@ main (int argc, char *argv[])
>  
>  	logsink = LOGSINK_SYSLOG;
>  
> -	if (getuid() != 0) {
> -		fprintf(stderr, "need to be root\n");
> -		exit(1);
> -	}
> -
>  	/* make sure we don't lock any path */
>  	if (chdir("/") < 0)
>  		fprintf(stderr, "can't chdir to root directory : %s\n",
> @@ -3420,6 +3415,11 @@ main (int argc, char *argv[])
>  		return err;
>  	}
>  
> +	if (getuid() != 0) {
> +		fprintf(stderr, "need to be root\n");
> +		exit(1);
> +	}
> +
>  	if (foreground) {
>  		if (!isatty(fileno(stdout)))
>  			setbuf(stdout, NULL);
> -- 
> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

