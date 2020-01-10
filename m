Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 366B5138E58
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jan 2020 10:57:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578909462;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=4i7omdHDzzJ4T5fWw5HcXq88qAh1nYUprQTAcora7CY=;
	b=ZS2KeWfbsruDC55OxIsOC66RtpsxzoOIKO6ts9cuzIKQuciIuc/fOIPqqtHwVDJt3logtV
	h6/GfInLEoJD+1/uK4aIku1DtyvghTn0vrP1O8skxgtv4/3J1UlEomoSC1a72EH07oA9TV
	7SWLJ4gRTaK+MxvtatoiWiqWDHgBKEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-drmAYoMAOaqiLGEdGX8SsA-1; Mon, 13 Jan 2020 04:57:40 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EE25DBF3;
	Mon, 13 Jan 2020 09:57:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 435E180895;
	Mon, 13 Jan 2020 09:57:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 03B0E1809567;
	Mon, 13 Jan 2020 09:57:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00ALFAch010243 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 10 Jan 2020 16:15:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F3B3A2166B28; Fri, 10 Jan 2020 21:15:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E990E2166B2B
	for <dm-devel@redhat.com>; Fri, 10 Jan 2020 21:15:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FE2785A30E
	for <dm-devel@redhat.com>; Fri, 10 Jan 2020 21:15:06 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1578690905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=C8GBtJ196IFX9cxSREfosN3o/zYH/gplkFDFfxjZfsQ=;
	b=ilaE+Qsu3efDGz69bhfDeY4WB8eLkJNpphBs3O5N1ImgyVKT+FDegZr5X4ny4q1/G26t+i
	ffFGX6UTeuL+Xpe8k0sD58pJJvwn/cBgOiW0y6zhA3RHbW2iiFBgOMJR65EO7NFIwQKiIs
	3gccNDmsrhqEnTMl/zNcsgCTMTIFTCNZj+qaHlIlZS+gPNfC4jicq+/+jU1sB0ZRspx65A
	fR+gN8hgtj5RIwDjVndG33pz6I1gR5UEKLTH/+Q/J6b623SYernyF7YQm16xxVmjKIJ591
	/2fTlgy2k2kdCN3+Mq9uldXTeJhOHpWt0dG8z7gRB8SJxrHNoIQohBRuxc0Tbg==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1578690905; a=rsa-sha256;
	cv=none;
	b=Zw2QMublBw4zs4pShC0o12WA3gpdy6nkJVM7WycWvYWGfOloP6xYcm6qBcz70WgbGUbD6d
	frV3Pxng12Cam7DtKk17YBAOdWLtgiIdg4VUK2IJbmP/7p44kcrpiepkbriz9GSNHNpsE1
	to3wsIQWnddkO+wpP53qMxMivLhpTi0Srk9zbuPHEmBv7mp1/hhsiHU4PqT+OdRGcCIsr1
	iGCrwWaN7EscbYPRrs4/blNzsqzNU667wMNUQt8xXYQbrTRdCEx9XJ2NviVN/mvGao4rfd
	7UxMjQyxvnhzXL8QB2ohpGJJVSBQzXvKdbXQMka2HYeeWX6LNVv+9McZbYi+yA==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=google.com header.s=20161025 header.b=YWh2wCyG;
	spf=pass (relay.mimecast.com: domain of khazhy@google.com designates
	209.85.222.193 as permitted sender)
	smtp.mailfrom=khazhy@google.com
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-415-Cf3mqQ_oO_Wzvi31xjs4Dw-1; Fri, 10 Jan 2020 16:15:04 -0500
X-MC-Unique: Cf3mqQ_oO_Wzvi31xjs4Dw-1
X-MC-Unique: drmAYoMAOaqiLGEdGX8SsA-1
Received: by mail-qk1-f193.google.com with SMTP id d71so3328123qkc.0
	for <dm-devel@redhat.com>; Fri, 10 Jan 2020 13:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WoRVDcCTJPXxaj5lzV8bbWWLxRKoaPHOTsv9hN9BVjw=;
	b=YWh2wCyGcdZmojnS1qT4gdIpsHuhXeesT0EPOcayioWLGFRhF39p11e5oPSz9OhdYQ
	g1JRIYbkPw7Iw/Ws3uiuNMj6eynYJ9mnjgoM+JvlGSWfVVfbqtZB6XEQx2dxpL5HKmCv
	4oB6YBZF96LW8hf/FYFHCajTxf5Fb33N3+V9yzVl6b0g3scraHpQLcLjvlS/l/jDUDGg
	R2IcKKLIQDQ2XClsJVQ6gWQ8wV4vSsX3EQkesPJi3Ag83AaxLK2U09YLi66oanL8uHJU
	S3CJSLl1K42c2kQN6IMuLBatZqcD3pLDO4RKxKN6ffgYc/bZQS6zesh/Wj8RCRS146jH
	JH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WoRVDcCTJPXxaj5lzV8bbWWLxRKoaPHOTsv9hN9BVjw=;
	b=g07Hj0h6GN8nZXh1PE9UnmITj0JZYqdya3TUiBw2APsvz8x62PMip+7/+UH0E4OjKM
	ZFve/GzkbkbcY9oTYMt2VJk0w7ZTpmJp+PuVJyUNldLCqQhdI9yxeU80ouqd1K0XIeu2
	6sc/2VCn2CfPP5br9hVq/Etw23Z7/xOCBxc+huG2CzW7Wwj3c8R+v6zoN1z/xNSAD1DA
	QvmnUAWf1AVf2yTxosgLD5mphuD/Z2oM9bJqGVfTdOvvAeTl4vtW5PmNoRpBMf00aZFm
	tz4sL+QL3CEhhYlaRDeS+W+7gRbEnQyjKQ2F2fFlnEfNC3CDqfRNFN6eBcYfGcXgRmQu
	iYeA==
X-Gm-Message-State: APjAAAUJxm7YSWsxpo1Q7ESFhzzci5DvV99/GPVC1IL4K80Hn5gRM3Ov
	1KVvUXXmxPlu6kEwoKC4BhMB/YzJZ5By/jQP+BrVSLWK
X-Google-Smtp-Source: APXvYqyx0zzgjEysR8dnZ4aJIT0tC/zqtHQiuiP0T1OvtuJsmXfvwpbyaCZB5ncgasvJQyHVKeFkDTZactgV5oBchUw=
X-Received: by 2002:a37:f514:: with SMTP id l20mr5053901qkk.421.1578690903406; 
	Fri, 10 Jan 2020 13:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20200102224512.3605010-1-krisman@collabora.com>
	<20200106162833.GA15829@redhat.com>
	<CACGdZYK25G5BqQeG2AeF9JvwhXOtcFRxxwqGdRugnPC+vYJHXQ@mail.gmail.com>
	<20200110193334.GA13817@redhat.com> <85h8135cgs.fsf@collabora.com>
In-Reply-To: <85h8135cgs.fsf@collabora.com>
From: Khazhismel Kumykov <khazhy@google.com>
Date: Fri, 10 Jan 2020 13:14:51 -0800
Message-ID: <CACGdZYJVVjAmg-cjhsruQN59QGYhNN_zb5HY+MQhvgQmn5gs1Q@mail.gmail.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
X-Mimecast-Spam-Score: 0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 13 Jan 2020 04:57:03 -0500
Cc: Mike Snitzer <snitzer@redhat.com>, Bharath Ravi <rbharath@google.com>,
	dm-devel@redhat.com, Anatol Pomazau <anatol@google.com>,
	kernel@collabora.com, Frank Mayhar <fmayhar@google.com>, agk@redhat.com
Subject: Re: [dm-devel] dm mpath: Add timeout mechanism for queue_if_no_path
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
Content-Type: multipart/mixed; boundary="===============0397476667107026652=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15

--===============0397476667107026652==
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="0000000000008c3df7059bcf9e1d"

--0000000000008c3df7059bcf9e1d
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 10, 2020 at 11:38 AM Gabriel Krisman Bertazi
<krisman@collabora.com> wrote:
>
> Mike Snitzer <snitzer@redhat.com> writes:
>
> > On Mon, Jan 06 2020 at  4:52pm -0500,
> > Khazhismel Kumykov <khazhy@google.com> wrote:
> >
> >> On Mon, Jan 6, 2020 at 11:28 AM Mike Snitzer <snitzer@redhat.com> wrote:
> >> >
> >> > On Thu, Jan 02 2020 at  5:45pm -0500,
> >> > Gabriel Krisman Bertazi <krisman@collabora.com> wrote:
> >> >
> >> > > From: Anatol Pomazau <anatol@google.com>
> >> > >
> >> > > Add a configurable timeout mechanism to disable queue_if_no_path without
> >> > > assistance from multipathd.  In reality, this reimplements the
> >> > > no_path_retry mechanism from multipathd in kernel space, which is
> >> > > interesting for cases where we cannot rely on a daemon being present all
> >> > > the time, in case of failure or to reduce the guest footprint of cloud
> >> > > services.
> >> > >
> >> > > Despite replicating the policy configuration on kernel space, it is
> >> > > quite an important case to prevent IOs from hanging forever, waiting for
> >> > > userspace to behave correctly.
> >> > >
> >> > > Co-developed-by: Frank Mayhar <fmayhar@google.com>
> >> > > Signed-off-by: Frank Mayhar <fmayhar@google.com>
> >> > > Co-developed-by: Bharath Ravi <rbharath@google.com>
> >> > > Signed-off-by: Bharath Ravi <rbharath@google.com>
> >> > > Co-developed-by: Khazhismel Kumykov <khazhy@google.com>
> >> > > Signed-off-by: Khazhismel Kumykov <khazhy@google.com>
> >> > > Signed-off-by: Anatol Pomazau <anatol@google.com>
> >> > > Co-developed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> >> > > Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> >> >
> >> > This seems like a slippery slope.
> >> >
> >> > I've heard this line of dm-multipath concern from Google before
> >> > (e.g. doesn't want to rely on availability of userspace component).
> >> >
> >> > Thing is, to properly use dm-multipath (e.g. to reinstate failed paths)
> >> > multipathd really is needed no?
> >> Yeah, in order to reinstate the failed paths, or any full recovery, we
> >> do need the user space component to be running, and this doesn't aim
> >> to change the responsibilities here. Rather, we're aiming to avoid
> >> in-kernel hangs/processes lingering indefinitely in unkillable sleep
> >> due to buggy/unavailable/down userspace multipath daemon.
> >
> > Sorry but the above patch header clearly states:
> > "or to reduce the guest footprint of cloud services"
> >
> > Which implies that multipathd isn't available by design in the
> > referenced environment.
> >
> >> >
> >> > If not, how is it that the proposed patch is all that is missing when
> >> > multipathd isn't running?  I find that hard to appreciate.
> >> >
> >> > So I'm inclined to not accept this type of change.  But especially not
> >> > until more comprehensive context is given for how Google is using
> >> > dm-multipath without multipathd.
> >>
> >> This patch isn't aimed at enabling dm-multipath without a userspace
> >> multipath daemon, rather to avoid processes hanging indefinitely in
> >> the event the daemon is unable to proceed (for whatever reason).
> >
> > Again, I don't buy it given the patch header explicitly says
> > dm-multipath could be deployed in the cloud without the benefit of
> > multipathd running.
>
> Hey Mike,
>
> I believe that was my fault, I misunderstood the google's use case, when I
> modified the commit message.

ditto, not trying to mislead, just clear up the misunderstanding :)

> > But I'll meet you half-way to start: rather than make the timeout
> > configurable on a per multipath table basis, please just set a longer
> > stopgap default and allow that timeout value to be configured with a
> > module parameter (e.g. dm_multipath.queue_if_no_path_timeout=120,
> > and setting it to 0 disables the timeout).
> >
> > This would follow the same pattern that was established by DM
> > thin-provisioning's no_space_timeout modparm with these commits:
> > 85ad643b dm thin: add timeout to stop out-of-data-space mode holding IO forever
> > 80c57893 dm thin: add 'no_space_timeout' dm-thin-pool module param
> >
> > That'd save us from having to do a bunch of fiddley DM multpath table
> > parsing for now.  But if for some crazy reason in the future it is
> > determined that a longer duration stop-gap timeout cannot be
> > one-size-fits-all we can layer per device configuration in at that
> > time.
> >
> > How does that sound?
>
> That seems reasonable to me.  Let me see what Khazhismel thinks and I
> can follow up with a v2.

Modparam sounds good to me. As far as we've seen, one size does fit
all, so we can drop the unneeded parsing.

Thanks,
Khazhy

--0000000000008c3df7059bcf9e1d
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIS5wYJKoZIhvcNAQcCoIIS2DCCEtQCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghBNMIIEXDCCA0SgAwIBAgIOSBtqDm4P/739RPqw/wcwDQYJKoZIhvcNAQELBQAwZDELMAkGA1UE
BhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExOjA4BgNVBAMTMUdsb2JhbFNpZ24gUGVy
c29uYWxTaWduIFBhcnRuZXJzIENBIC0gU0hBMjU2IC0gRzIwHhcNMTYwNjE1MDAwMDAwWhcNMjEw
NjE1MDAwMDAwWjBMMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEiMCAG
A1UEAxMZR2xvYmFsU2lnbiBIViBTL01JTUUgQ0EgMTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBALR23lKtjlZW/17kthzYcMHHKFgywfc4vLIjfq42NmMWbXkNUabIgS8KX4PnIFsTlD6F
GO2fqnsTygvYPFBSMX4OCFtJXoikP2CQlEvO7WooyE94tqmqD+w0YtyP2IB5j4KvOIeNv1Gbnnes
BIUWLFxs1ERvYDhmk+OrvW7Vd8ZfpRJj71Rb+QQsUpkyTySaqALXnyztTDp1L5d1bABJN/bJbEU3
Hf5FLrANmognIu+Npty6GrA6p3yKELzTsilOFmYNWg7L838NS2JbFOndl+ce89gM36CW7vyhszi6
6LqqzJL8MsmkP53GGhf11YMP9EkmawYouMDP/PwQYhIiUO0CAwEAAaOCASIwggEeMA4GA1UdDwEB
/wQEAwIBBjAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwEgYDVR0TAQH/BAgwBgEB/wIB
ADAdBgNVHQ4EFgQUyzgSsMeZwHiSjLMhleb0JmLA4D8wHwYDVR0jBBgwFoAUJiSSix/TRK+xsBtt
r+500ox4AAMwSwYDVR0fBEQwQjBAoD6gPIY6aHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9ncy9n
c3BlcnNvbmFsc2lnbnB0bnJzc2hhMmcyLmNybDBMBgNVHSAERTBDMEEGCSsGAQQBoDIBKDA0MDIG
CCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzANBgkqhkiG
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
BQUHMAKGNGh0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzaHZzbWltZWNhMS5j
cnQwHQYDVR0OBBYEFJ2Vb0jiXUWlD5ibz23a558NzWOgMB8GA1UdIwQYMBaAFMs4ErDHmcB4koyz
IZXm9CZiwOA/MEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0dHBzOi8v
d3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMDsGA1UdHwQ0MDIwMKAuoCyGKmh0dHA6Ly9j
cmwuZ2xvYmFsc2lnbi5jb20vZ3NodnNtaW1lY2ExLmNybDAOBgNVHQ8BAf8EBAMCBaAwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMA0GCSqGSIb3DQEBCwUAA4IBAQCk2Fht/QkHdD9YQlQ/
/BoVlZzl+wg2oB8mPQEGNN49NfSL/ERAGoituF3/Zv+xv6owWk2Xp+sTA69OuAt2wZ4O0pXm2NNb
yE0QS1h/jH61IgJY4dU65qPcUYmkEdBDRX3XzR1wmnDc3yelHxlYerMuJFmSM5g4dIjbdpOlHTGh
jnWrjPPoGaT9nEbPfTxkahJTybnCIMuQbt8nl2QdV64GhBMCQWbIW1xY6Uv0FZcadQhF1vzhd/OH
qGkK98y1Dz/54GBO4A8jOSeDFuh+l2iygTcH16xKfB0XvhoUGdrru24FTEY7p4VTKkw+eJbUvdod
PlESVftk7+JISQWxBEYKMYICXjCCAloCAQEwXDBMMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xv
YmFsU2lnbiBudi1zYTEiMCAGA1UEAxMZR2xvYmFsU2lnbiBIViBTL01JTUUgQ0EgMQIMROfpbOE2
LmBNcT9PMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCAchnBAgAVaQGu+sq+KFQdA
TyEApIR+npfBYmrlLKFGITAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEP
Fw0yMDAxMTAyMTE1MDRaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
FjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsGCSqGSIb3DQEBBzALBglg
hkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAg1oe0DuLwu16NL/LF9ExK/HMtx9Tt/Q8SpXhhvbn
HpRg95RGsSLyed1TuT6sRN2quWTYa93jAvcXea7Rq4IxcfYxf/tdb3hIE64VXTd6sE45+n4b1gY4
ppMWiNZVkBRQMz5CX3/8DibbNplFiOcFzpdvtYEHux4PNSGg3CpUU3ijB6bd18SPK4+HErW2rkcy
EKCwqe5YAqGUmUXGftEUEuFT5OrFDwNdWalW85ES4Uz/wHXJ4EA53LaOwBpNn0hygYJVqGMHruBJ
z/An8uQDPa3C7dYlq6OEfcWnUG61VDTSQfpWfLpr9dtbnl1DaRKUE0iTYpaO6nEwu9WDI1pU5A==

--0000000000008c3df7059bcf9e1d--


--===============0397476667107026652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============0397476667107026652==--

