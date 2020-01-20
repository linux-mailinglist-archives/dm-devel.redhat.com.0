Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B9C7D142EB6
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jan 2020 16:26:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579533983;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k5up8s5zv79W0eeiaF3sAbHaZUXHQXmv5FS206e1YDY=;
	b=WN6Xe7Fqy94bRchIB3q6pvmEt7txMq3xySMcBy/sigsoJ2h5Bqlsh3cvG9hBweavyPrFA+
	xa5rx7vQyQI/Sfkn2kNk8kjR+9aqxCxOhiGS9n3c4wIUlpsi+5IBwihAOZq1QxEsvW2MUa
	XZ3BKmAvEYDhLLNuPYIgGpNth5BcI/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-cwbpKOXaP8-p-7cL5TbQEg-1; Mon, 20 Jan 2020 10:26:22 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51338107ACC4;
	Mon, 20 Jan 2020 15:26:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1EA45C290;
	Mon, 20 Jan 2020 15:26:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2675581974;
	Mon, 20 Jan 2020 15:26:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00KFQ2wq020491 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jan 2020 10:26:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 504205D9E2; Mon, 20 Jan 2020 15:26:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82B695D9E1;
	Mon, 20 Jan 2020 15:25:59 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 00KFPwRT009800; 
	Mon, 20 Jan 2020 09:25:58 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 00KFPvJe009799;
	Mon, 20 Jan 2020 09:25:57 -0600
Date: Mon, 20 Jan 2020 09:25:57 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200120152557.GP30153@octiron.msp.redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-16-git-send-email-bmarzins@redhat.com>
	<e45a8a4058b97970412455f835c00e1982d8a5d0.camel@suse.de>
MIME-Version: 1.0
In-Reply-To: <e45a8a4058b97970412455f835c00e1982d8a5d0.camel@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 15/15] tests: add directio unit tests
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: cwbpKOXaP8-p-7cL5TbQEg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jan 20, 2020 at 09:27:25AM +0100, Martin Wilck wrote:
> On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  tests/Makefile   |   3 +-
> >  tests/directio.c | 704
> > +++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 706 insertions(+), 1 deletion(-)
> >  create mode 100644 tests/directio.c
> > 
> > diff --git a/tests/Makefile b/tests/Makefile
> > index a5cdf390..275fdd7d 100644
> > +
> > +/* test async checkers pending and getting resovled by another
> > checker
> > + * as well as the loops for getting multiple events */
> > +static void test_check_state_async(void **state)
> > +{
> > +	int i;
> > +	struct checker c[257] = {0};
> > +	struct async_req *reqs[257];
> > +	int res[257] = {0};
> > +
> > +	do_libcheck_load();
> > +	for (i = 0; i < 257; i++)
> > +		do_libcheck_init(&c[i], 4096, &reqs[i]);
> > +	for (i = 0; i < 256; i++) {
> > +		return_io_getevents_none();
> > +		do_check_state(&c[i], 0, 30, PATH_PENDING);
> > +		assert_true(is_checker_running(&c[i]));
> > +	}
> > +	return_io_getevents_nr(&full_timeout, 256, reqs, res);
> > +	return_io_getevents_nr(NULL, 1, &reqs[256], &res[256]);
> > +	do_check_state(&c[256], 0, 30, PATH_UP);
> > +	assert_false(is_checker_running(&c[256]));
> > +	libcheck_free(&c[i]);
> 
> Writing &c[256] here would be better readable. Apart from that, this is
> looking good. Some of the tests are implementation-specific, but that's
> fine if we stick with this implementation.
> 
> I wish we could have some tests with real aio for this, but that would
> be difficult to set up right. Perhaps scsi_debug could be leveraged for
> it.

I initially wrote this using a config file in tests, where if you
uncommented a line, and set it to a device, the tests would run on that
device.  Otherwise, it would skip the directio tests entirely. It was
easier to get the failures that I wanted with completely faking the
device, so I switched to this. I reasoned that the parts where you are
talking to the device, and it is responding like it should are easy
enough to test by actually running multipath/multipathd. Perhaps I could
add that back, but only use it for some of the tests, or just use the
wrap code to be able to only use the underlying functions (which talk to
the device) some of the time, and skip them if I need a certain result.
I'll take a look. 

-Ben

> 
> Regards
> Martin
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

