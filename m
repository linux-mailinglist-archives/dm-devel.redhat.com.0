Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 313F313230B
	for <lists+dm-devel@lfdr.de>; Tue,  7 Jan 2020 10:55:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578390947;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=v1x+JfPbIalFyhjMEOtrm7/F9cqsOWxEEC0ucoowyVM=;
	b=LrsgQoMPzKwP2NJqJuKojZyH2NGUDFd+2Q01rwjAsrApiLjbWJcGOmKNhJ3KSphyQxJpKD
	6ZErpVi6Xz2MDwWzg0QfLoDgMgbTYOXbcEoO340ZO+sTa/hRUBer5hdtQw5WhpQqD4MQh6
	/YPNvf5Vgh4l5gGxbCNfePnjotb/p4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-lJhBXJlVPHy6ph7hryMW7w-1; Tue, 07 Jan 2020 04:55:45 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF260593AB;
	Tue,  7 Jan 2020 09:55:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DE35858B9;
	Tue,  7 Jan 2020 09:55:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6984818089CD;
	Tue,  7 Jan 2020 09:55:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 006LqHvb006761 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 16:52:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7EACA2022AC6; Mon,  6 Jan 2020 21:52:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 755A62022AA8
	for <dm-devel@redhat.com>; Mon,  6 Jan 2020 21:52:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDFF5802085
	for <dm-devel@redhat.com>; Mon,  6 Jan 2020 21:52:14 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1578347534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Du65DQrnhOtuNw8mF2fETqbibkicek14WW4xkfOMEYo=;
	b=hJCX5cY+mIVuQByKCbJBeBaXvKL2pcQSQAnno0Ry4d9QxUzhqPURJEIBTovatIjqutuTMJ
	lpM1czEMwv70OxX6cODM4Ai0gGHlMVfhuVrpX2r1wC1w1+uU/u3xBvxOAt+MCm7Al0Coyc
	SAP1h1Hjx8bDCbEuEAPbgHvDEOM0fp85PRScJNiWGiBSJqUOC2ps2IoQSb56AaF4baRAoW
	4+DXk99nhJ49v8b5fGc/4/HO4cH1HMdg1TtrfRjHFugi4qDUTqOtHTHdPx6TiAWD3F7wwt
	44ZgLTNC/+/9R14O4Unu2JYnKuG+6WCd14dkgYbVMMtfEbxlpVdspSQoBWlPwg==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1578347534; a=rsa-sha256;
	cv=none;
	b=fOZyUTSvG9pHjW4LIUZQenqFBtmtqFk0dim1qr1wBQ+USmdY2BfLvznypsxgeR9j+Ksy3D
	EGEniXMr27a2KkiHwrF5s2czKftk80O8qyJtXpOae2gOjnR80rkYRH7bW776/2irFM9VBU
	+FOjf5YhR3ndUzhKOeY7/tSJRR79gKuc4AsSMnSQppVu/fW4njV+uu9eR5Am4GaaoINKLT
	36O6oMQ7bbXOWwlhnRsY4CnZBcib7yQ2HsRLM+K+0xp3YZzJm0v6/S6Y5/MX0yOs5A/xGm
	nQZYWql7jLJDOmGLhXv/mfNaHOSL07/Gn0vXhIgh9WZClFtxcXQMMXtngKD+TQ==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=google.com header.s=20161025 header.b=NLj2a6yf;
	spf=pass (relay.mimecast.com: domain of khazhy@google.com designates
	209.85.222.196 as permitted sender)
	smtp.mailfrom=khazhy@google.com
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-198-lie_lW0oMg-bk4F8UKiBZg-1; Mon, 06 Jan 2020 16:52:12 -0500
X-MC-Unique: lie_lW0oMg-bk4F8UKiBZg-1
X-MC-Unique: lJhBXJlVPHy6ph7hryMW7w-1
Received: by mail-qk1-f196.google.com with SMTP id r14so40853685qke.13
	for <dm-devel@redhat.com>; Mon, 06 Jan 2020 13:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UpHLQhVIYqkBsyefKtbLfK2E438/PwPfrk6JHdkZS/k=;
	b=NLj2a6yfEHFqW2kDo+p5m0bgohDYjQSqJtyVSNM2uwy6u0UhM9l2eLOfNiAe3MGfk6
	rApAfLGN9sdrFc9pWyk//CqU0LgNVcmG0XhE0O5Dv4N30Eux6xFVJXsGcMPkEMIiu9Fa
	WPf9wT3zLCM83DoITsz+ZntN02x4KyAL+HtqpS6/1mRUIa2yteeHRnvmpsOYHNPJyG2d
	vimP6x8Zh3+Dj5VwlFPsmzhgJyUAAzHr5aqV2/w/vA0iPiFAyMM/+1yb9CMgQtnLX8ri
	lgXJryZE89f9vNMV+EVhVeOExNEP3hBij/Z/qCY7TOA6jkIzzLN2ktBwVvdMIS7/cyy/
	onLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UpHLQhVIYqkBsyefKtbLfK2E438/PwPfrk6JHdkZS/k=;
	b=CvJIH7uC/rMx5HhC7y6oe6gXD59lFvPwL7arGY/2vogaqJGdt7DbXUUreHCjP49PDI
	xHKqO6ZAkKrv0JyL+YRFXhMikEWGS/sslQdU0fXLGtvwcVSJmqcX1sKvbIC/2Yq7Q1PC
	h4BHVmjT0cYEeFC+vEudWUD9EoDYkI1yDPWexbdqwVrn/F8kG9nXnO4OQldF5ZpWBV/5
	Ly9pYlxE1D5xtfcTzY02FbiS8l3MFVUocTz7CgqoevK1xYI3iln+BonfAVC/AldNBM6i
	p83CA40Cqx3P8pug6Is/fnYDyerNwJ5fCkFOhvGc5zn04y9XJVHafF9ORP58R7hI/3VT
	JIHQ==
X-Gm-Message-State: APjAAAXQwE5jSNfmGzjHAjOJ37mHiTjVMIlOUQiLwqNmN/DgM3YFqvDO
	g+G+j1no2tR3QwHYBvA+I7gM+ppP/LVWwvxqIvpKJg==
X-Google-Smtp-Source: APXvYqxw9Zi4GnC+JYdHzwLRHcznt8aXJp9s9IE70iAOpGn3s65BTLtYcbd7eo8eJkfe5O9TjXQRCCrf+QF6iv8ki+M=
X-Received: by 2002:ae9:ebd4:: with SMTP id
	b203mr85657807qkg.501.1578347532090; 
	Mon, 06 Jan 2020 13:52:12 -0800 (PST)
MIME-Version: 1.0
References: <20200102224512.3605010-1-krisman@collabora.com>
	<20200106162833.GA15829@redhat.com>
In-Reply-To: <20200106162833.GA15829@redhat.com>
From: Khazhismel Kumykov <khazhy@google.com>
Date: Mon, 6 Jan 2020 16:52:00 -0500
Message-ID: <CACGdZYK25G5BqQeG2AeF9JvwhXOtcFRxxwqGdRugnPC+vYJHXQ@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Mimecast-Spam-Score: 0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 07 Jan 2020 04:55:04 -0500
Cc: Frank Mayhar <fmayhar@google.com>, dm-devel@redhat.com,
	Anatol Pomazau <anatol@google.com>,
	Bharath Ravi <rbharath@google.com>, kernel@collabora.com,
	Gabriel Krisman Bertazi <krisman@collabora.com>, agk@redhat.com
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
Content-Type: multipart/mixed; boundary="===============6507287631907936018=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13

--===============6507287631907936018==
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="000000000000041fbe059b7faced"

--000000000000041fbe059b7faced
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 6, 2020 at 11:28 AM Mike Snitzer <snitzer@redhat.com> wrote:
>
> On Thu, Jan 02 2020 at  5:45pm -0500,
> Gabriel Krisman Bertazi <krisman@collabora.com> wrote:
>
> > From: Anatol Pomazau <anatol@google.com>
> >
> > Add a configurable timeout mechanism to disable queue_if_no_path without
> > assistance from multipathd.  In reality, this reimplements the
> > no_path_retry mechanism from multipathd in kernel space, which is
> > interesting for cases where we cannot rely on a daemon being present all
> > the time, in case of failure or to reduce the guest footprint of cloud
> > services.
> >
> > Despite replicating the policy configuration on kernel space, it is
> > quite an important case to prevent IOs from hanging forever, waiting for
> > userspace to behave correctly.
> >
> > Co-developed-by: Frank Mayhar <fmayhar@google.com>
> > Signed-off-by: Frank Mayhar <fmayhar@google.com>
> > Co-developed-by: Bharath Ravi <rbharath@google.com>
> > Signed-off-by: Bharath Ravi <rbharath@google.com>
> > Co-developed-by: Khazhismel Kumykov <khazhy@google.com>
> > Signed-off-by: Khazhismel Kumykov <khazhy@google.com>
> > Signed-off-by: Anatol Pomazau <anatol@google.com>
> > Co-developed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> > Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
>
> This seems like a slippery slope.
>
> I've heard this line of dm-multipath concern from Google before
> (e.g. doesn't want to rely on availability of userspace component).
>
> Thing is, to properly use dm-multipath (e.g. to reinstate failed paths)
> multipathd really is needed no?
Yeah, in order to reinstate the failed paths, or any full recovery, we
do need the user space component to be running, and this doesn't aim
to change the responsibilities here. Rather, we're aiming to avoid
in-kernel hangs/processes lingering indefinitely in unkillable sleep
due to buggy/unavailable/down userspace multipath daemon.
>
> If not, how is it that the proposed patch is all that is missing when
> multipathd isn't running?  I find that hard to appreciate.
>
> So I'm inclined to not accept this type of change.  But especially not
> until more comprehensive context is given for how Google is using
> dm-multipath without multipathd.

This patch isn't aimed at enabling dm-multipath without a userspace
multipath daemon, rather to avoid processes hanging indefinitely in
the event the daemon is unable to proceed (for whatever reason).

>
> Thanks,
> Mike
>

--000000000000041fbe059b7faced
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
LmBNcT9PMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCAvWzI6uBufllhtYSln5D6m
pNjufelRKsaOsMTtlH/grjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEP
Fw0yMDAxMDYyMTUyMTJaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQB
FjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsGCSqGSIb3DQEBBzALBglg
hkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAo87Y7vnpQ51yHRV5+iDwjjOYK7jh98/eGpW0Fxa0
SMoe+UzixFX9u291UCo8xDZKg4H/GGAZ5R5YCH0pBxLRgD30FMHZormqPXiRl/yfTAnBRaBwM/v2
eXAaoJpAaTA6KqFwjVuj3NDh6UZ/wzc+q4qxfnpFuCwoJvz0pxDtv3wjiZz8WWeV0sKtEk2EtaBr
HJt92MyMKvrskaYPHDKDabSvzmROEBQDxGYEYb+hV4JOP+dPNDPUSth5hTpPHtOOwFhqEvmvOagZ
UDtuupcnaYpmf4T/pMsc92aMKA+wD9IFLWvrdPXbyn8KqAHcRPuc1oxyBtsfUzkgAp2WXsVc8w==

--000000000000041fbe059b7faced--


--===============6507287631907936018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============6507287631907936018==--

