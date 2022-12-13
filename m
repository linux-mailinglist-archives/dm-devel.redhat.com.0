Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E86A64BE88
	for <lists+dm-devel@lfdr.de>; Tue, 13 Dec 2022 22:35:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670967336;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TbenOeLe6BX3VmJvN21jkgwAGvFXBPyEn87iIt37NTg=;
	b=QqP5WjefKJDzjGVlLTQueikgAq4icMzMYlmU42lRYdAvrcmsw6fWwGAFDHVuhpso8zntAU
	c6Dy+iM3YFtoziWbB1tYPzUE+cAUOoK2Dq+lPe6W/ZfwmPTyikCcDP8PYT6tVckAuAUcRG
	rtxb3lFydb8c+ITEbWJAWMpRx2rbjEI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-OO5uNvZwPlCqbBpg-8p5YQ-1; Tue, 13 Dec 2022 16:35:34 -0500
X-MC-Unique: OO5uNvZwPlCqbBpg-8p5YQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04868806001;
	Tue, 13 Dec 2022 21:35:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B0820C15BA0;
	Tue, 13 Dec 2022 21:35:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4F6C319465B6;
	Tue, 13 Dec 2022 21:35:25 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 26FDE1946586
 for <dm-devel@listman.corp.redhat.com>; Tue, 13 Dec 2022 21:35:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 108D8492C18; Tue, 13 Dec 2022 21:35:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 099F4492C14
 for <dm-devel@redhat.com>; Tue, 13 Dec 2022 21:35:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE2703C0F23F
 for <dm-devel@redhat.com>; Tue, 13 Dec 2022 21:35:23 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-223-bOOeppmzOqWfvQ9HEl7Esg-1; Tue,
 13 Dec 2022 16:35:20 -0500
X-MC-Unique: bOOeppmzOqWfvQ9HEl7Esg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D529A1F88B;
 Tue, 13 Dec 2022 21:35:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A713B138EE;
 Tue, 13 Dec 2022 21:35:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id s8KWJhbwmGNmSAAAMHmgww
 (envelope-from <mwilck@suse.com>); Tue, 13 Dec 2022 21:35:18 +0000
Message-ID: <1d0b29df40355efa83bdb0aee930eff3da6fecdc.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 13 Dec 2022 22:35:18 +0100
In-Reply-To: <20221213175048.GG19568@octiron.msp.redhat.com>
References: <20221202234338.2960-1-mwilck@suse.com>
 <20221207003730.GC19568@octiron.msp.redhat.com>
 <3cddb507361a3c582a11a2c752bfbae43c92aa37.camel@suse.com>
 <20221213175048.GG19568@octiron.msp.redhat.com>
User-Agent: Evolution 3.46.2
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [dm-devel] [PATCH v2] libmultipath: is_path_valid(): check if
 device is in use
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-12-13 at 11:50 -0600, Benjamin Marzinski wrote:
> On Tue, Dec 13, 2022 at 08:46:28AM +0100, Martin Wilck wrote:
> > On Tue, 2022-12-06 at 18:37 -0600, Benjamin Marzinski wrote:
> >=20
> > > is set to "smart", the common case will still be
> > > that
> > > the device is in the wwids file, so we know that it's valid. I
> > > don't
> > > see
> > > a reason to do this check in that case.=A0 I was thinking that for
> > > the
> > > "smart" case, this check should go at the end of the function,
> > > before
> > > we
> > > return PATH_IS_MAYBE_VALID. Or do you have a reason why we should
> > > do
> > > it
> > > here that I'm missing?
> >=20
> > I'd argue the other way around: if the device is in use, it doesn't
> > matter any more whether or not it's listed in the WWIDs file. This
> > situation can only occur if something went wrong beforehand (most
> > probably, an inconsistent WWIDs file in the initrd, or some other
> > component misbehaving). If we tag such a device VALID although it's
> > mounted, we'll almost certainly fall into emergency mode,
> > regardless of
> > the find_multipaths mode we're in. The reason is that multipathd
> > will
> > fail to map the mounted device, and systemd will consider the path
> > device unusable, leading to the device being inaccessible either
> > way.
>=20
> Sure. We can leave it like this. I don't have strong opinions one way
> or
> the other.

Thanks.

Next step is: I provide this to the partner for testing who observed
the issues described in the commit message. I will only push this
upstream if we find it to be helpful.

Martin

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

