Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6C16825B20F
	for <lists+dm-devel@lfdr.de>; Wed,  2 Sep 2020 18:51:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599065478;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5OVFI37HO00obIHhB7qzaKT6M8R/RUXHs5kvxVU6Yf8=;
	b=J7RAClEbJJ1qwaKt8vj0Ay7Pe78JfZUMxuC3T4bctpahJtBRGYaHqIIrzU36FcLcVeHnY1
	JZMErE8qkoORnIx/skKSIjNQHhW22yNNZrQzhfYbJKJHPQmBR7zUx/eevr+rKZidxb4JQK
	gX/oDwHrAD0/XqKME38dQS0X8PSRW8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-mlSZlmVGOiyHTbokw1w-iA-1; Wed, 02 Sep 2020 12:51:16 -0400
X-MC-Unique: mlSZlmVGOiyHTbokw1w-iA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A15DF1091060;
	Wed,  2 Sep 2020 16:51:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 804C487A6C;
	Wed,  2 Sep 2020 16:51:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED33F183D020;
	Wed,  2 Sep 2020 16:51:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 082Gp5uG008364 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 12:51:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D445787B2D; Wed,  2 Sep 2020 16:51:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2B0487B28;
	Wed,  2 Sep 2020 16:51:01 +0000 (UTC)
Date: Wed, 2 Sep 2020 12:51:01 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Coly Li <colyli@suse.de>
Message-ID: <20200902165101.GB5928@redhat.com>
References: <20200902160432.GA5513@redhat.com>
	<df0203fa-7f75-53ac-8bf1-79a1c861918e@suse.de>
	<20200902164456.GA5928@redhat.com>
	<4968af50-663d-74cf-1be2-aaed48a380d5@suse.de>
MIME-Version: 1.0
In-Reply-To: <4968af50-663d-74cf-1be2-aaed48a380d5@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, linux-nvdimm@lists.01.org,
	Vishal Verma <vishal.l.verma@intel.com>, dm-devel@redhat.com,
	Jan Kara <jack@suse.com>, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [dm-devel] flood of "dm-X: error: dax access failed" due to 5.9
 commit 231609785cbfb
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

On Wed, Sep 02 2020 at 12:46pm -0400,
Coly Li <colyli@suse.de> wrote:

> On 2020/9/3 00:44, Mike Snitzer wrote:
> > On Wed, Sep 02 2020 at 12:40pm -0400,
> > Coly Li <colyli@suse.de> wrote:
> > 
> >> On 2020/9/3 00:04, Mike Snitzer wrote:
> >>> 5.9 commit 231609785cbfb ("dax: print error message by pr_info() in
> >>> __generic_fsdax_supported()") switched from pr_debug() to pr_info().
> >>>
> >>> The justification in the commit header is really inadequate.  If there
> >>> is a problem that you need to drill in on, repeat the testing after
> >>> enabling the dynamic debugging.
> >>>
> >>> Otherwise, now all DM devices that aren't layered on DAX capable devices
> >>> spew really confusing noise to users when they simply activate their
> >>> non-DAX DM devices:
> >>>
> >>> [66567.129798] dm-6: error: dax access failed (-5)
> >>> [66567.134400] dm-6: error: dax access failed (-5)
> >>> [66567.139152] dm-6: error: dax access failed (-5)
> >>> [66567.314546] dm-2: error: dax access failed (-95)
> >>> [66567.319380] dm-2: error: dax access failed (-95)
> >>> [66567.324254] dm-2: error: dax access failed (-95)
> >>> [66567.479025] dm-2: error: dax access failed (-95)
> >>> [66567.483713] dm-2: error: dax access failed (-95)
> >>> [66567.488722] dm-2: error: dax access failed (-95)
> >>> [66567.494061] dm-2: error: dax access failed (-95)
> >>> [66567.498823] dm-2: error: dax access failed (-95)
> >>> [66567.503693] dm-2: error: dax access failed (-95)
> >>>
> >>> commit 231609785cbfb must be reverted.
> >>>
> >>> Please advise, thanks.
> >>
> >> Adrian Huang from Lenovo posted a patch, which titled: dax: do not print
> >> error message for non-persistent memory block device
> >>
> >> It fixes the issue, but no response for now. Maybe we should take this fix.
> > 
> > OK, yes sounds like it.  It was merged and is commit c2affe920b0e066
> > ("dax: do not print error message for non-persistent memory block
> > device")
> 
> Thanks for informing me this patch is merged, I am going to update my
> local one :-)

So the thing is I'm running v5.9-rc3 (which includes this commit) but
I'm still seeing all these warnings when I run the lvm2 testsuite.  The
reason _seems_ to be because the lvm2 testsuite uses brd devices for
test devices.  So there is something about the brd device that shows
commit c2affe920b0e066 isn't enough :(

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

