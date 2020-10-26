Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 41A742992EF
	for <lists+dm-devel@lfdr.de>; Mon, 26 Oct 2020 17:50:48 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-cIA9GpMnMFKRorVTUs2f0w-1; Mon, 26 Oct 2020 12:50:45 -0400
X-MC-Unique: cIA9GpMnMFKRorVTUs2f0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79B52107B103;
	Mon, 26 Oct 2020 16:50:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 511125C1BB;
	Mon, 26 Oct 2020 16:50:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 179F0181A86E;
	Mon, 26 Oct 2020 16:50:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09QGM8jS024906 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 26 Oct 2020 12:22:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB374112D410; Mon, 26 Oct 2020 16:22:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C52F5112D40B
	for <dm-devel@redhat.com>; Mon, 26 Oct 2020 16:22:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A6F0185A78B
	for <dm-devel@redhat.com>; Mon, 26 Oct 2020 16:22:06 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-371-ry0ZQytZMWOQ_msPmaacJA-1;
	Mon, 26 Oct 2020 12:22:04 -0400
X-MC-Unique: ry0ZQytZMWOQ_msPmaacJA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A7DC5AC4D;
	Mon, 26 Oct 2020 16:22:02 +0000 (UTC)
Message-ID: <b90e91621122ebfacd85a548e0ec7a9aa59865e3.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 26 Oct 2020 17:22:00 +0100
In-Reply-To: <20201020022008.GK3384@octiron.msp.redhat.com>
References: <20201016104501.8700-1-mwilck@suse.com>
	<20201016104501.8700-30-mwilck@suse.com>
	<20201020022008.GK3384@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 29/29] libmultipath: fix race between
 log_safe and log_thread_stop()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-19 at 21:20 -0500, Benjamin Marzinski wrote:
> On Fri, Oct 16, 2020 at 12:45:01PM +0200, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > log_safe() could race with log_thread_stop(); simply
> > checking the value of log_thr has never been safe. By converting
> > the
> > mutexes to static initializers, we avoid having to destroy them,
> > and thus
> > possibly accessing a destroyed mutex in log_safe(). Furthermore,
> > taking
> > both the logev_lock and the logq_lock makes sure the logarea isn't
> > freed
> > while we are writing to it.
> > 
> 
> I don't see any problems with this, but I also don't think it's
> necssary
> to hold the log thread lock (logev_lock), just to add a message to
> the
> queue. It seems like protecting the log queue is the job of
> logq_lock.
> As long as log_safe() enqueues the message before flush_logqueue() is
> called in log_thread_stop(), it should be fine. This could be solved
> by
> simply having a static variable in log_pthread.c named something like
> log_area_enabled, that always accessed while holding the logq_lock,
> and
> is set to true when the log_area is created, and set to false just
> before calling the flush_logqueue() in log_thread_stop().

If we do this, we might as well use the variable "la" itself for that,
and make sure it's only accessed under the lock. It'd be fine, because
la is used if and only if the log thread is active, and spare us
another variable. I had actually considered that, thought it was too
invasive for the already big series. If you prefer this way, I can do
it. 

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

