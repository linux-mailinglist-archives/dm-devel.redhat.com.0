Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3B92613BA
	for <lists+dm-devel@lfdr.de>; Tue,  8 Sep 2020 17:46:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599579977;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=awio64aLrXpgYF6FbUQeGtT4PSgMi1biZq3dA5dJL4M=;
	b=R50hzkfiG5omdyzYHl6yDUj9rRNPxlX32CfJ8gGEiEfb+ylEUbQwZfAyOVRPjruxZGuz7E
	D7pxJPW//JGE0yM0lR4WBkK322pjBmjyhfq/v3gESv4F3CO3bc1W4pO56LYQkI4D8nYTrI
	deMvf+nDTY8B/Z3KKuWqdj/BaBSRfsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-kUloPkktOO2FUXJVMZO_XA-1; Tue, 08 Sep 2020 11:46:15 -0400
X-MC-Unique: kUloPkktOO2FUXJVMZO_XA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 611F31074647;
	Tue,  8 Sep 2020 15:46:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 842D919C4F;
	Tue,  8 Sep 2020 15:46:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6E877A008;
	Tue,  8 Sep 2020 15:45:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 088FjmJW005713 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Sep 2020 11:45:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 53BCE5DC06; Tue,  8 Sep 2020 15:45:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AC415D9F7;
	Tue,  8 Sep 2020 15:45:43 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 088FjfIT016314; 
	Tue, 8 Sep 2020 10:45:42 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 088FjfOZ016313;
	Tue, 8 Sep 2020 10:45:41 -0500
Date: Tue, 8 Sep 2020 10:45:41 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20200908154540.GK11108@octiron.msp.redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<40cf77df-eaa3-fb72-69fd-9f865d12dc34@huawei.com>
	<20200904213048.GE11108@octiron.msp.redhat.com>
	<8dd72a70-991a-cb7d-3279-3d5036df1b9d@huawei.com>
MIME-Version: 1.0
In-Reply-To: <8dd72a70-991a-cb7d-3279-3d5036df1b9d@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 09/14] libmultipath: check whether
 mp->features is NULl in, assemble_map
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Sep 07, 2020 at 08:21:28PM +0800, lixiaokeng wrote:
> 
> >> @@ -86,9 +86,12 @@ assemble_map (struct multipath * mp, char * params, int len)
> >>  	    get_linux_version_code() < KERNEL_VERSION(4, 3, 0))
> >>  		add_feature(&mp->features, retain_hwhandler);
> >>
> >> -	f = STRDUP(mp->features);
> > 
> > clearly strdup()ing without checking if mp->features NULL is incorrect.
> > However, I'm not sure that we need to fail if mp->features is NULL.
> > instead, int the APPEND call, we could use the gcc ternary operator
> > extension
> > 
> > (mp->features)?: "0"
> > 
> > to use "0" if mp->features is NULL.
> > 
> > Also, have you seen this actually occur?  Or is this just a theoretical
> > issue that you've found from reading the code.  It seems like
> > setup_map() will always call select_features() before calling
> > assemble_map(), which should mean that mp->features will always be set
> > in this case. Perhaps I'm missing something here.
> > 
> > -Ben
> > 
> Hi Ben,
>   This just a theoretical issue and I did not see it. But it's not necessary
> to call strdup. In your opinion, need multipath be checked?  I will make new
> patch with your suggestion.

Since we don't believe it's possible for mp->features (or mp->hwhandler)
to be set to NULL here, it makes sense to print an error if it is NULL.
So, I guess my suggestion would be to print an error message if
mp->features or mp->hwhandler are NULL, but to assemble the map anyway,
using the default value of "0" if they are NULL. That's how
assemble_map() currently handles failures in add_feature().
add_feature() will print an error, but assemble_map() will go ahead with
assembling the map.

I'm willing to be convinced that there is a better solution, however.

-Ben
 
> -Lixiaokeng
> >> +	if (!mp->features) {
> >> +		condlog(0, "mp->features is still NULL.");
> >> +		goto err;
> >> +	}
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

