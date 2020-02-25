Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 50E1616ED50
	for <lists+dm-devel@lfdr.de>; Tue, 25 Feb 2020 18:59:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582653549;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AzTDgx97IU6/v9q9UOLZdY4qc0R532ccs2fhIlStPQ4=;
	b=AxelPjtcniN5o9qMyXF4kxxkJ7vWQdpwCsRCoZCuCzjQ06UttUzECQMBIRbl1ijp6KrEVO
	jEq03+Pu7zqO/nau8XJUfWr1KLNPQQa3DW+zROlZSO7S3tmhJIzBj47A4hAVggc8kfUKJo
	q/q8xn3c1BYiGEk/+rHf3Qx0ohAo+q0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-f2dNWAX6NUCF1OxvcS90jA-1; Tue, 25 Feb 2020 12:59:07 -0500
X-MC-Unique: f2dNWAX6NUCF1OxvcS90jA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A2511005516;
	Tue, 25 Feb 2020 17:59:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F363909FD;
	Tue, 25 Feb 2020 17:58:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6A77860F7;
	Tue, 25 Feb 2020 17:58:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01PHwPlQ028710 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Feb 2020 12:58:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C6E2391840; Tue, 25 Feb 2020 17:58:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F22A38681F;
	Tue, 25 Feb 2020 17:58:22 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01PHwL7l014542; 
	Tue, 25 Feb 2020 11:58:21 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01PHwKjX014541;
	Tue, 25 Feb 2020 11:58:20 -0600
Date: Tue, 25 Feb 2020 11:58:20 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200225175820.GO30153@octiron.msp.redhat.com>
References: <8f4d39d663aad324017297db0d31a0a24369c9a4.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <8f4d39d663aad324017297db0d31a0a24369c9a4.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: "George, Martin" <Martin.George@netapp.com>,
	Hannes Reinecke <hare@suse.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>, "Schremmer,
	Steven" <Steve.Schremmer@netapp.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	JulianAndresKlode <julian.klode@canonical.com>
Subject: Re: [dm-devel] RFC: multipath-tools: NVMe native multipath and
 default setting for "enable_foreign"
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Feb 19, 2020 at 05:17:48PM +0100, Martin Wilck wrote:
> multipath-tools has support for "foreign" libraries in multipath-tools
> since 0.8.0, and support for enabling/disabling them at runtime since
> 0.8.3.
> 
> The only foreign library that exists is "nvme" (for native NVMe
> multipath), and it's likely to remain so for some time. Currently
> upstream multipath-tools ships with all foreign libraries enabled by
> default, and documentation about how to disable them.
> 
> There's an ongoing discussion between myself and folks from Netapp
> about changing the code such that the nvme library is disabled by
> default. People at Netapp are worried that multipath's output for NVMe
> native multipath maps would confuse customers and break scripts.
> I've suggested that Netapp simply ship a drop-in configuration file
> to be put in /etc/multipath/conf.d to disable the nvme library, but I'm
> told that customers are wary about vendor-supplied configuration files.
> 
> For SUSE's enterprise product, SLE, we have made this change and
> disabled the nvme library by default. Now Netapp is asking me to
> forward this change upstream. Personally, I'm not too fond of the
> proposal, because I think the original idea (enable people to use the
> tools they are used to) is still valid (*). OTOH, the "nvme" tool can
> provide similar information and is likely to be used by NVMe users
> anyway, so perhaps there's no urgent need for this functionality in
> multipath-tools any more.
> 
> I really don't know if people out there find this feature rather
> helpful or rather confusing. Therefore I'd like to ask for opinions
> here on the list.

In RHEL we don't disable them in the builtin defaults, since we already
had a release with them enabled. Instead we disable them in the default
config file that we use (at Netapp's request).

In the next major RHEL release, I have nothing really against disabling
them by default. Unfortunately, since they are now disabled in for most
users in SLE and RHEL, it's hard to guage how much interest people have
in them. I do think that some people will find them useful, and not want
to change their config file to use them (especially since they may not
have any dm-multipathed devices at all, and not really need a config
file).  Perhaps disabling them by default, but including command line
option to enable all foreign libraries would be a reasonable compromise.
Then people who wanted to use this for native NVMe would just add
something like "-e" (for enable all foreign libraries) to their
commands.

-Ben
 
> Regards,
> Martin
> 
> (*) Also because I, myself, have put quite some effort into the
> "foreign/nvme" feature and wouldn't be happy to see it go away. 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

