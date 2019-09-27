Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AD121C090E
	for <lists+dm-devel@lfdr.de>; Fri, 27 Sep 2019 18:00:21 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 58990C0546FC;
	Fri, 27 Sep 2019 16:00:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 657F326359;
	Fri, 27 Sep 2019 16:00:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1DB0B4EE68;
	Fri, 27 Sep 2019 16:00:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8RFxkbB013039 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Sep 2019 11:59:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E57285C220; Fri, 27 Sep 2019 15:59:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8E645C21A;
	Fri, 27 Sep 2019 15:59:44 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 395ED10C0312;
	Fri, 27 Sep 2019 15:59:39 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP; 
	Fri, 27 Sep 2019 15:59:04 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 27 Sep 2019 15:59:07 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 27 Sep 2019 15:59:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=mUUVETDKhAE1Xh3oyqIZSjMyeMQSaeJP915WVtuguNVc/7F5Z5x4IzRKGMIllI6Zet6MLjYWoy2+o5KEGnjbr6frmno4owG79nBaR0hYNRGRIGic6YynfmAKKQPsUgfSf3Z5C0rmD9iZp7JJNftiUOikbsc8vqIiSu5NaIKHsAlNM5uWWFyNDD8sDe7IOmL3MeB/RnSICGQkNlzVfa9VenfCmNV7zcQmZKnAY2/zarIelyaowzjIsK65TgQDeUDtFOuzZq5dIRvHJQPxM2O0pRIaEBHnM6IhHo5Jlq0tzDvrM2V970wQERAo3eLm9SV9Ivjoh0gaJq1UtuRxDiMUGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QSLk9AcX1PrS4kq6qkhweBoGhONaoPfeCLRtN+tDn00=;
	b=nCroejbEMff/6GDALLyBHQMTjNqO8a4kAKHyc7hfFM6qVOFea8W5gHOUR8w5VbsrDrJVkihj/nS8rightV2CWvP+hDWgeYoTN05vrMDJ3LNyF63bpVJZV3SmP8e1BBmt4rFBR2Fw+O5Vgwb3uCSFpdfGSFy0MOAhDKmfOqY4xK1pXEu1mUmap11qhXQXHCQ4Geg08tzPkgIAX76WboFqpZgiGcmMhvpBuQLoQilGaIFAl7a0llb1JQT4uKqzQfStJt/cwRKE4XDsbEUwtDKpwCkfCD5FBD5LkeAQ0AG+EiSRaq3XZc8aqBbB6YoPOpcEV1UdYqEBakkx6NyPg3QWuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.245.83) by
	CH2PR18MB3301.namprd18.prod.outlook.com (52.132.246.78) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2284.26; Fri, 27 Sep 2019 15:59:05 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::1075:2453:9278:e985%5]) with mapi id 15.20.2305.017;
	Fri, 27 Sep 2019 15:59:05 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH] multipathd: warn when configuration has been changed.
Thread-Index: AQHVdUx8vc9lFTx3okaEpPWzuMbtLA==
Date: Fri, 27 Sep 2019 15:59:05 +0000
Message-ID: <6af607515513ef1a39869aed35c15774046a1bda.camel@suse.com>
References: <1569266956-6339-1-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1569266956-6339-1-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [2.203.223.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cce139b-bedc-4fe9-6468-08d743639f7a
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:CH2PR18MB3301; 
x-ms-traffictypediagnostic: CH2PR18MB3301:
x-microsoft-antispam-prvs: <CH2PR18MB330127623AFD1761B472819FFC810@CH2PR18MB3301.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(189003)(199004)(8936002)(8676002)(478600001)(26005)(229853002)(6486002)(14444005)(71190400001)(66946007)(99286004)(71200400001)(7736002)(305945005)(6506007)(186003)(66476007)(76116006)(91956017)(4326008)(86362001)(66066001)(6436002)(66556008)(110136005)(316002)(2501003)(486006)(64756008)(36756003)(66446008)(11346002)(6246003)(25786009)(6116002)(118296001)(6512007)(256004)(2616005)(5660300002)(2906002)(14454004)(76176011)(446003)(3846002)(81166006)(102836004)(476003)(81156014);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3301;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qJ8D7PkI5x2W2hnY2sOIuWtH4mXW557r+7Cg1Vj7dg64UslFT4tppQoa7XzIiNJxVGiGNh1OclNYFGdqI6NCfstmAWQz5gkdiKROZTw2pzIo9PhrgFNXvt24Q11bm42cT3piBaSNklUfYECHvt/bhddrhyVv6ZmLqGOrXPrUJ69t+Nve/83UGdz8yLSHqWryJwfYIm0NAgM1RQL3NzbFRgyMbQBX8VD7vYcS4vm4bIRGbBVixqVqhCKkAlx0RrGmG6b3fD5J9O5CPmyoFR8G6a8q8jkHDr+BVdax9RNtQFKWAgleQv/DGPBNZPApT+DWGPKCPFwlv9PlHjfc/dUsdQxtZOutSmAvsEzzB/g+lfUpuNcpk8NlXDyknel+pz/5YUATLgkFQOhHsdXdL+wVoQFpT3KZrWvPd1qsBGlCHaM=
x-ms-exchange-transport-forked: True
Content-ID: <F1D7AB8130B4764FAB8D0ACFA6C17CB2@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cce139b-bedc-4fe9-6468-08d743639f7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 15:59:05.1656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GzvyAvYTFMUNvrNq+ZiJluE6hofyQXut8B+CmJmhlKLZ1uGxcUaj4uT2hYnDJBBAGnyvC62uN3ggXh2GYIoukQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3301
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.65]); Fri, 27 Sep 2019 15:59:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Fri, 27 Sep 2019 15:59:43 +0000 (UTC) for IP:'15.124.64.67'
	DOMAIN:'m9a0002g.houston.softwaregrp.com'
	HELO:'m9a0002g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.67
	m9a0002g.houston.softwaregrp.com 15.124.64.67
	m9a0002g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8RFxkbB013039
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] multipathd: warn when configuration has been
	changed.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Fri, 27 Sep 2019 16:00:19 +0000 (UTC)

On Mon, 2019-09-23 at 14:29 -0500, Benjamin Marzinski wrote:
> It would be helpful if multipathd could log a message when
> multipath.conf or files in the config_dir have been written to, both
> so
> that it can be used to send a notification to users, and to help with
> determining after the fact if multipathd was running with an older
> config, when the logs of multipathd's behaviour don't match with the
> current multipath.conf.
> 
> To do this, the multipathd uxlsnr thread now sets up inotify watches
> on
> both /etc/multipath.conf and the config_dir to watch if the files are
> deleted or closed after being opened for writing.  In order to keep
> uxlsnr from polling repeatedly if the multipath.conf or the
> config_dir
> aren't present, it will only set up the watches once per reconfigure.
> However, since multipath.conf is far more likely to be replaced by a
> text editor than modified in place, if it gets removed, multipathd
> will
> immediately try to restart the watch on it (which will succeed if the
> file was simply replaced by a new copy).  This does mean that if
> multipath.conf or the config_dir are actually removed and then later
> re-added, multipathd won't log any more messages for changes until
> the
> next reconfigure. But that seems like a fair trade-off to avoid
> repeatedly polling for files that aren't likely to appear.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/config.h |   1 +
>  multipathd/main.c     |   1 +
>  multipathd/uxlsnr.c   | 134
> ++++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 130 insertions(+), 6 deletions(-)
> 

So, next, after we get a notification, we wait a few seconds and call
reconfigure() automatically? Well I guess before we do that we should
implement a dry-run with a syntax check...

I found one minor issue, see below. Otherwise, ACK.

Thanks,
Martin

> +void handle_inotify(int fd, int  *wds)
> +{
> +	char buff[1024]
> +		__attribute__ ((aligned(__alignof__(struct
> inotify_event))));
> +	const struct inotify_event *event;
> +	ssize_t len;
> +	char *ptr;
> +	int i, got_notify = 0;
> +
> +	for (;;) {
> +		len = read(fd, buff, sizeof(buff));
> +		if (len <= 0) {
> +			if (len < 0 && errno != EAGAIN) {
> +				condlog(3, "error reading from
> inotify_fd");
> +				for (i = 0; i < 2; i++) {
> +					if (wds[i] != -1) {
> +						inotify_rm_watch(fd,
> wds[0]);

Should this be wds[i] instead?


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
